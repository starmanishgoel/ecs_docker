#!/bin/sh
#set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "PREREQUISITE:"
echo '1. Get account Admin access by executing "aws configure"'
echo '2. Get region specific access for ECR by executing "aws ecr get-login --region <region where you want to bring application like ap-south-1> --no-include-email"'
echo '3. Test docker connectivity with ECR by executing out put of "Section 2"'
echo '4. get terrfaorm in "bin" folder, if terraform set as env variable please edit script replace "$DIR/bin/terraform" with "terraform"'
echo "##########################################"
# tested with Terraform v0.11.3
echo "Please Enter Details to Push Image to ECR"
echo "EC Repository URI:"
read ecrarn


docker build -f ./docker_html_site/Dockerfile  -t $ecrarn ./docker_html_site
docker push $ecrarn


region="$(cut -d'.' -f4 <<<"$ecrarn")"


echo "##########################################"

echo "Executing terraform (getting into terraform folder)"

cd terraform 
$DIR/bin/terraform init
$DIR/bin/terraform plan -var="app_image=$ecrarn:latest" -var="aws_region=$region"


echo "Ready to execute apply? [y,n]"
read input

if [[ "$input" == "y" ]] || [[ "$input" == "yes" ]]; then
   $DIR/bin/terraform apply -var="app_image=$ecrarn:latest" -var="aws_region=$region"
else
   exit
fi



