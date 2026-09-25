# Threat Model

## Assets
- Source code
- Container image
- AWS infrastructure
- Kubernetes workloads
- CI/CD credentials
- Logs and security findings

## Threats
1. Secret accidentally committed to Git
2. Vulnerable dependency
3. Vulnerable container base image
4. Insecure Terraform configuration
5. Excessive AWS permissions
6. Kubernetes privilege escalation
7. Unauthorized AWS API activity

## Controls
| Threat | Control |
|---|---|
| Git secret leak | Gitleaks |
| SAST issue | Semgrep |
| Dependency/image CVE | Trivy |
| IaC misconfiguration | Checkov |
| Excessive permissions | IAM least privilege |
| Container privilege | Non-root + dropped capabilities |
| Pod lateral movement | NetworkPolicy |
| AWS activity | CloudTrail |
| Threat detection | GuardDuty |
| Findings aggregation | Security Hub |
