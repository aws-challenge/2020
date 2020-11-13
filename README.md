# 2020/21
Challenge to validate AWS Skills


## The challenge

This company is ingesting data into a 'data lake' running AWS. Below are the AWS compnents used for the architecture. 

### Part 1
Take the compnents and create an architecture with your choice tool (powerpoint / draw.io / etc) that can ingest data from an on-premise site into AWS. Upload the diagram/picture into the Git Repo and indicate where it's saved. Use the Groups / Icons as far as possible to illustrate your solution.

(./media/awscp.png)

#### Hints
* Keep the solution low cost & high performing as far as possible.
* All Data should be stored within S3 buckets.
* Athena needs to be used to query the data.
* Indicate how you will you Step Functions to orchistrate the complete process.
* Show the involvement of AWS DynamoDB / CloudWatch.
* Glue Jobs should be used to do the ingest.
* CloudFormation output is a CodeBuild Project
* Git is used to save the terraforms and python / pyspark code.
* You do not have to indicate the actual CI/CD but understand that it's already in place.
* Look at the available .tf files to get an understanding of the architecure.
___


### Part 2
Within the Readme.md descibe the architecture above by giving detail when and how you would you the selected components.
#### Hints
* Consider aspects like security (iam / firewalls / vpc / security groups / roles)
* To each component used give a detail description on how will it suit the solution, please do not refernence exisitng AWS documentation, your own words!
___

### Part 3
Within the Git Repo Structure
* Modify the CloudFormation Template (./CFN/seed.yaml) which will create an CodeBuild Project.
* Update the glue_jobs.tf, main.tf and output.tf 
* Provide the python script that will be used within the glue job (python shell / spark) your choice.

## Instructions

Fork this repo with your solution. Ideally, we'd like to see your progression through commits, and don't forget to update the README.md to explain your thought process.

Please let us know how long the challenge takes you. We're not looking for how speedy or lengthy you are. It's just really to give us a clearer idea of what you've produced in the time you decided to take. Feel free to go as big or as small as you want.


####PART2######
Use this part to describe the solution. 