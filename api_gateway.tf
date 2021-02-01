resource "aws_api_gateway_rest_api" "shortify_api_gateway" {
  name = "Shortify Gateway"
}

resource "aws_api_gateway_resource" "shortify_api_gateway_resource" {
  rest_api_id = aws_api_gateway_rest_api.shortify_api_gateway.id
  parent_id   = aws_api_gateway_rest_api.shortify_api_gateway.root_resource_id
  path_part   = "shorten"
}

resource "aws_api_gateway_method" "shortify_api_gateway_method" {
  rest_api_id      = aws_api_gateway_rest_api.shortify_api_gateway.id
  resource_id      = aws_api_gateway_resource.shortify_api_gateway_resource.id
  http_method      = "POST"
  authorization    = "NONE"
  api_key_required = false
}

resource "aws_api_gateway_integration" "shortify_api_gateway_integration" {
  rest_api_id = aws_api_gateway_rest_api.shortify_api_gateway.id
  resource_id = aws_api_gateway_method.shortify_api_gateway_method.resource_id
  http_method = aws_api_gateway_method.shortify_api_gateway_method.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.shortify_lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "shortify_api_gateway_deployment" {
  depends_on = [aws_api_gateway_integration.shortify_api_gateway_integration]

  rest_api_id = aws_api_gateway_rest_api.shortify_api_gateway.id
  stage_name  = "shortify"
}
