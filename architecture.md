# Architecture

1. Developer pushes source code to GitHub.
2. GitHub Actions starts the security pipeline.
3. Semgrep checks application source code.
4. Gitleaks checks for accidentally committed secrets.
5. Checkov scans Terraform.
6. Docker builds the application image.
7. Trivy scans the image for HIGH/CRITICAL vulnerabilities.
8. Approved images can be pushed to ECR.
9. Kubernetes deploys the image to EKS.
10. AWS CloudTrail records API activity.
11. GuardDuty detects suspicious activity.
12. Security Hub aggregates security findings.
