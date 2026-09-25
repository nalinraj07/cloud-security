# Example least-privilege IAM policy for application access.
# Add only the permissions actually required by the workload.

data "aws_iam_policy_document" "app_read_only_example" {
  statement {
    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = ["*"]
  }
}
