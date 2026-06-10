$env:HOME="$env:USERPROFILE"
Write-Host "===== CI/CD START ====="
mvn -f ../demo/pom.xml clean package
docker build -t demo-app ../demo

# STAGING
docker rm -f staging-app 2>$null
docker run -d -p 8081:8080 --name staging-app demo-app
Write-Host "Staging: http://localhost:8081/demo"
echo "STAGING SUCCESS" > staging.txt

aws --endpoint-url=http://localhost:4566 s3 cp staging.txt s3://artifact-bucket/ --no-verify-ssl --no-checksum-algorithm

aws --endpoint-url=http://localhost:4566 --region us-east-1 sqs send-message `
  --queue-url "http://localhost:4566/000000000000/pipeline-queue" `
  --message-body "STAGING DONE"

$stagingItem = '{"id":{"S":"1"},"status":{"S":"STAGING DONE"}}'
aws --endpoint-url=http://localhost:4566 --region us-east-1 dynamodb put-item `
  --table-name pipeline-status `
  --item $stagingItem

pause

# PRODUCTION
docker rm -f prod-app 2>$null
docker run -d -p 8082:8080 --name prod-app demo-app
Write-Host "Production: http://localhost:8082/demo"
echo "PRODUCTION SUCCESS" > prod.txt

aws --endpoint-url=http://localhost:4566 s3 cp prod.txt s3://artifact-bucket/ --no-verify-ssl --no-checksum-algorithm

aws --endpoint-url=http://localhost:4566 --region us-east-1 sqs send-message `
  --queue-url "http://localhost:4566/000000000000/pipeline-queue" `
  --message-body "PRODUCTION DONE"

$prodItem = '{"id":{"S":"2"},"status":{"S":"PRODUCTION DONE"}}'
aws --endpoint-url=http://localhost:4566 --region us-east-1 dynamodb put-item `
  --table-name pipeline-status `
  --item $prodItem

Write-Host "===== DONE ====="