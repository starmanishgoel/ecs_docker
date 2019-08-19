SRE Challenge:

How to Get Environment:

PREREQUISITE:
1. Get account Admin access by executing "aws configure"
2. Get region specific access for ECR by executing "aws ecr get-login --region <region where you want to bring application like ap-south-1> --no-include-email"
3. Test docker connectivity with ECR by executing out put of "Section 2"
4. Get terraform in "bin" folder 

Setup:
Single click deployment + Parameters
run "./setup.sh"
Pass asked values and it will setup environment for you.

Scale, Limitation and Scope:

Scale:
1. This is very basic design to get a running environment with bare minimum resources to get the page visible.
2. Scale the existing by modifying variable's value in variable.tf file
3. current environment is running on 80 port if we want to make it secure, Get certificate arn from the region and update variables.tf + update main.tf at lb and security level. Part commented to run without cert

Limitation:
1. This setup is for HTMl page so on security side no out bounds are set for other services.
2. No IAM role used just assigned one default one for fargate.
3. No Monitoring enabled.
4. All logic in single file just for my ease/sample project.

Scope:
1. Enable Monitoring.
2. Module based depelopment for code reusability
3. Variablised to support mulltiple application.
4. secure by using certs/loading certs
5. More security rules and Role for complex apllication
6. State preservation at S3 /locking
7. Much more advancement on docker side as per Application Type
8. Automated ECR Repo creation 
9. Creation of Automated flow on on-boarding new application.


#Note: Just to make file size small at last removed terraform exe file from bin


Implemented by:
Manish Goel
Email:manishgoel173@gmail.com






