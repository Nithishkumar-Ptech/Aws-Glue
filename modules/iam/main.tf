resource "aws_iam_role" "glue_role" {
  name = "glue-crawler-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "glue.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy_attachment" "glue_policy_attach" {
  name       = "glue-role-policy-attach"
  roles      = [aws_iam_role.glue_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}