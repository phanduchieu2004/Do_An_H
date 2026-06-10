$QUEUE_URL="http://localhost:4566/000000000000/pipeline-queue"

Write-Host "Listening SQS..."

while ($true) {
    $result = awslocal sqs receive-message `
        --queue-url $QUEUE_URL `
        --max-number-of-messages 1 `
        --wait-time-seconds 5

    if ($result -match "Body") {
        Write-Host "Message received:"
        Write-Host $result

        # TODO: xử lý message (deploy / call API / ghi DB)
    }
}
