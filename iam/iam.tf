resource "aws_iam_role" "ecs_task_iam_role" {
  name = "ecs_task_iam_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "ecs_task_iam_policy" {
  name = "ecs_task_iam_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_iam_role_policy_attachment" {
  role       = aws_iam_role.ecs_task_iam_role.name
  policy_arn = aws_iam_policy.ecs_task_iam_policy.arn
}

resource "aws_iam_role" "ecs_execution_iam_role" {
  name = "ecs_execution_iam_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_execution_iam_role_policy_attachment" {
  role       = aws_iam_role.ecs_execution_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
