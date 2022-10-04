resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name = "amol_new_key"
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id]

  tags = {
    "Name" = "EC2 Demo 2"
  }
}

resource "aws_key_pair" "amol" {
  key_name   = "amol_new_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC01O7GEpaBr7rxs1fd6OR/KStzLgJYQnV9+Hho3v3HzFqXOpS8kH6I6mEA2lFx6w9efydGISmgOo7kWe1Ubd8VJ/F/qMxYuLjdz9Y3nI+Qs88owzcEtboztSceWVIMatdQ7msN0p9CqobVH+GAnVZOkPFffhUsDmxujmgX2xv3wPd17oaUBwvVK2+0lqmUvjmrbAdWYDDTPGTarlOaJEQcdqphtneZi1erVnEkMeAiHZONbxUT2bzr1zyHYjKbe5vMi9pP+whHEY2tjUOXCqKMPxxxINDaiLlK80zCiT09rsJLwMPHv9hWKq/clsrlC4oeoU+6uycAyyoX+j4eRftl root@ip-172-31-40-140.ap-south-1.compute.internal"

}

resource "aws_cloudwatch_metric_alarm" "cw_test" {
     alarm_name                = "cpu-utilization"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods        = "2"
     metric_name               = "CPUUtilization"
     namespace                 = "AWS/EC2"
     period                    = "60" #seconds
     statistic                 = "Average"
     threshold                 = "70"
     alarm_description         = "This metric monitors ec2 cpu utilization"
     insufficient_data_actions = []
     ok_actions                = [aws_sns_topic.cw_topic.arn]
     alarm_actions             = [aws_sns_topic.cw_topic.arn ]
     

dimensions = {

       InstanceId = aws_instance.myec2vm.id
       action_enabled  = " true "


     }

}

