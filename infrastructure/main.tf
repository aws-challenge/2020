# main.tf 2 modules for 1 for a step function and 1 for the actual glue job


module "step_1_parallelism" {

}


module "glue_ingest_default_job" {

}
/**
 * A Terraform module representing a scheduled Batch job. Uses a Cloud Watch Event Rule and a Lambda function to submit the Batch job on a cron schedule
*/

# the name of the scheduled job
variable "name" {}

# the batch job definition to run
variable "batch_job_definition" {}

# the batch job queue to submit to
variable "batch_job_queue" {}

# the schedule to execute the job on
variable "schedule_expression" {}

# whether or not the job will be run
variable "is_enabled" {
  default = "true"
}

# tags
variable "tags" {
  type = "map"
}

# glue function to submit batch job
data "template_file" "lambda_source" {
  template = <<EOF
'use strict';
const AWS = require('aws-sdk');
exports.handler = (event, context, callback) => {
  console.log('Received event: ', event);
  const params = {
    jobName: '$${name}',
    jobDefinition: '$${batch_job_definition}',
    jobQueue: '$${batch_job_queue}',
    containerOverrides: event.containerOverrides || null,
    parameters: event.parameters || null,
  };
  new AWS.Batch().submitJob(params, (err, data) => {
    if (err) {
      console.error(err);
      const message = 'Error calling SubmitJob for:' + event.jobName;
      console.error(message);
      callback(message);
    } else {
      const jobId = data.jobId;
      console.log('jobId:', jobId);
      callback(null, jobId);
    }
  });
};  
EOF

  vars {
    name                 = "${var.name}"
    batch_job_definition = "${var.batch_job_definition}"
    batch_job_queue      = "${var.batch_job_queue}"
  }
}

data "archive_file" "lambda_zip" {
  type                    = "zip"
  source_content          = "${data.template_file.lambda_source.rendered}"
  source_content_filename = "index.js"
  output_path             = "lambda-${var.name}.zip"
}

resource "aws_lambda_function" "func" {
  function_name    = "${var.name}"
  filename         = "${data.archive_file.lambda_zip.output_path}"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  role             = "${aws_iam_role.role.arn}"
  handler          = "index.handler"
  runtime          = "nodejs6.10"
  tags             = "${var.tags}"
}

resource "aws_lambda_permission" "permission" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.func.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.rule.arn}"
}

resource "aws_lambda_alias" "alias" {
  name             = "${var.name}"
  description      = ""
  function_name    = "${aws_lambda_function.func.function_name}"
  function_version = "$LATEST"
}

# cloud watch scheduled event
resource "aws_cloudwatch_event_rule" "rule" {
  name                = "${var.name}"
  description         = "fires the ${var.name} function on schedule: ${var.schedule_expression}"
  schedule_expression = "${var.schedule_expression}"
  is_enabled          = "${var.is_enabled}"
}

resource "aws_cloudwatch_event_target" "target" {
  rule = "${aws_cloudwatch_event_rule.rule.name}"
  arn  = "${aws_lambda_function.func.arn}"
}

resource "aws_iam_role" "role" {
  name = "${var.name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "batch" {
  name        = "${var.name}-batch"
  description = ""

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Action": [
        "batch:DescribeJobs",
        "batch:ListJobs",
        "batch:SubmitJob"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda-batch" {
  role       = "${aws_iam_role.role.name}"
  policy_arn = "${aws_iam_policy.batch.arn}"
}

resource "aws_iam_role_policy_attachment" "lambda-cw" {
  role       = "${aws_iam_role.role.name}"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

# the created cloudwatch event rule
output "cloudwatch_event_rule_arn" {
  value = "${aws_cloudwatch_event_rule.rule.arn}"
}

# the created lambda function
output "aws_lambda_function_arn" {
  value = "${aws_lambda_function.func.arn}"
}
 main.tf 2 modules for 1 for a step function and 1 for the actual glue job


module "step_1_parallelism" {

}


module "glue_ingest_default_job" {

}
