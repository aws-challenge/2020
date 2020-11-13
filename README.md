# 2020/21

## The AWS Solutions Architect / Developer Challenge

This company is ingesting data into a 'data lake' running AWS. Below find a picture of the AWS components used for this company's architecture. 

![AWS-COMPONENTS](/media/awscp.png)

### Part 1
Use the components used by the company and create an architecture with your tool of choice (powerpoint / draw.io / etc) showing how the data ingest from an on-premise site into AWS. Upload the diagram/picture into the Git Repo and indicate where it's saved. Use the given components as far as possible to illustrate your solution.

#### Hints
* Focus on *low cost & high* performance.
* All the data are stored in S3 buckets.
* Athena is used to query the data.
* Show how you will use Step Functions to orchestrate the *ingest* process.
* AWS DynamoDB / CloudWatch must be used.
* Glue Jobs should be used to do the ingest.
* CloudFormation output is a CodeBuild Project
* Git is used to save the terraforms and python / pyspark code.
* You do not have to design/depict the CI/CD, assume that it's already in place.
* Look at the available .tf files to get an understanding of the architecture.
___

### Part 2
Within this Readme.md describe the architecture above, giving detail when and how you would use the selected components.
#### Hints
* Consider aspects like security (iam / firewalls / vpc / security groups / roles)
* To each component used, give a detailed description on how it fits into the solution, please do not reference existing AWS documentation, your own words! Feel free to document your thought process. We are interested to find out how you think.
___

### Part 3
Within the Git Repo Structure
* Modify the CloudFormation Template [CFN/seed.yaml] in order to create a CodeBuild Project.
* Update the _glue_jobs.tf_, _main.tf_ and _output.tf_. 
* Provide the python script that will be used within the glue job, using either python shell or spark. Think here about using DynamoDB to keep certain job settings and table structures for s3.
___

## Instructions

> In general feel free to expand / change the challenge in any way you like, just explain your solution and decision making, any concerns > around it or limitations etc.

Fork this repo with your solution. Ideally, we'd like to see your progression through commits, and don't forget to update the README.md to explain your thought process.

Please let us know how long the challenge took you. We're not looking for how fast or detailed you are. It's just to give us a clearer idea of what you've produced in the time you decided to take. Feel free to go as big or as small as you want.

## Submit it

Send us your solution as a link to a public Github repository. In case you prefer to use a private repo just email us when you are done in order to let you know who to invite in it. 

##### My Solution 
Use this part to describe your solution as requested in Part2. 


##### Additional comments / information / concerns