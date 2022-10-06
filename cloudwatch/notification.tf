## SNS topic

resource "aws_sns_topic" "cw_topic" {
    name = "amol-topic"
  
}

## SNS Subscription

resource "aws_sns_topic_subscription" "cw_sub" {
    topic_arn = aws_sns_topic.cw_topic.arn
    protocol = "email"
    endpoint = "amoldoijad1@gmail.com"
  
}
