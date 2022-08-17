module "iam" {
  source = "./iam"

}

module "lambda" {
  source               = "./lambda"
  lambda_role          = module.iam.iam_arn
}

module "cloudwatch_event_rule" {
  source               = "./cloudwatch"
  lambda_function_arn  = module.lambda.lambda_arn
  lambda_function_name = module.lambda.lambda_name
}