
$QUEUE_URL="http://localhost:4566/000000000000/pipeline-queue"

$MESSAGE = "deploy request from script"

Write-Host "Sending message..."

awslocal sqs send-message `
  --queue-url $QUEUE_URL `
  --message-body "$MESSAGE"

Write-Host "Message sent!"
