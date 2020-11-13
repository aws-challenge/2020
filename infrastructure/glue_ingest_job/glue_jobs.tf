module "glue_job_default_artifact_py" {
  source       = "git::ssh://git..."
  filename     = "glue_job.py"
  #Fill in the rest of the terraform template needed
  }
}

module "glue_job_default_artifact_dependencies" {
  source       = "git::ssh://git..."
  filename     = "dependencies.zip"
  #Fill in the rest of the terraform template needed
  }
}

module "glue_ingest" {
  source = "git::ssh://git..."

  job_name = "ingest-glue-job"

  #Fill in the rest of the terraform template needed
  }
  glue_connections_name = var.config["glue_connections_list"]
}

