data "archive_file" "python_lambda_package" {
  type = "zip"
  source_file = "${path.module}/code/lambda_function.py"
  output_path = var.lambda_zip_name
}
resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = "${path.module}/requests.zip"
  layer_name = "import_request_layer"

  compatible_runtimes = ["python3.8"]
}

resource "aws_lambda_function" "lambda_function" {
    function_name = var.function_name
    filename      = var.lambda_zip_name
    source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
    role          = var.lambda_role 
    runtime       = "python3.8"
    handler       = "lambda_function.lambda_handler"
    timeout       = 60
    memory_size   = 512
    layers = [aws_lambda_layer_version.lambda_layer.arn]
}

