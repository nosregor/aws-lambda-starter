resource "aws_lambda_function" "shortify_lambda" {
  function_name    = "shortify_lambda"
  filename         = "${path.module}/shortify_lambda.zip"
  handler          = "index.handler"
  runtime          = "nodejs12.x"
  role             = aws_iam_role.shortify_lambda_role.arn
  source_code_hash = data.archive_file.shortify_lambda.output_base64sha256

  environment {
    variables = {
      lambda_variable = var.lambda_variable
    }
  }
}


data "archive_file" "shortify_lambda" {
  type        = "zip"
  source_dir  = "${path.module}/shortify_lambda"
  output_path = "${path.module}/shortify_lambda.zip"
}

