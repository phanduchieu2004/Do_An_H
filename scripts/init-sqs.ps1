
$QUEUE_NAME="pipeline-queue"
$QUEUE_URL="http://localhost:4566/000000000000/$QUEUE_NAME"

Write-Host "Checking if queue exists..."

$queues = awslocal sqs list-queues 2>$null

if ($queues -match $QUEUE_NAME) {
    Write-Host "Queue already exists: $QUEUE_NAME"
} else {
    Write-Host "Creating queue: $QUEUE_NAME"
    awslocal sqs create-queue --queue-name $QUEUE_NAME
}

Write-Host "Done!"
