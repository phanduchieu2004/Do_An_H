$QUEUE_URL="http://localhost:4566/000000000000/pipeline-queue"

Write-Host "Receiving message..."

awslocal sqs receive-message `
  --queue-url $QUEUE_URL

Write-Host "Done!"
