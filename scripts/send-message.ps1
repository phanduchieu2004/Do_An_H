awslocal sqs send-message `
  --queue-url http://localhost:4566/000000000000/pipeline-queue `
  --message-body "deploy"
