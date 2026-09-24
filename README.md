# Cloud Security Monitoring & DevSecOps Pipeline on AWS

A practical portfolio project demonstrating DevSecOps controls for a containerized application deployed to AWS.

## Security controls

- SAST: Semgrep
- Secret scanning: Gitleaks
- Container scanning: Trivy
- IaC scanning: Checkov
- CI/CD: GitHub Actions
- Infrastructure: Terraform
- Container registry: Amazon ECR
- Runtime target: Amazon EKS
- AWS security services: CloudTrail, GuardDuty, Security Hub
- Kubernetes: NetworkPolicy and non-root container

## Architecture

Developer -> GitHub -> GitHub Actions
                         |-- Semgrep
                         |-- Gitleaks
                         |-- Checkov
                         |-- Trivy
                         v
                       Docker
                         v
                      AWS ECR
                         v
                       AWS EKS
                         |
          +--------------+--------------+
          | IAM / SG / NetworkPolicy    |
          | CloudTrail / GuardDuty       |
          | Security Hub / CloudWatch   |
          +-----------------------------+

## Repository structure

```text
cloud-security-devsecops/
├── app/
├── kubernetes/
├── terraform/
├── security/
├── scripts/
├── .github/workflows/
└── docs/
```

## Local prerequisites

- Git
- Docker
- Python 3.11+
- Terraform
- AWS CLI
- kubectl
- Optional: kind/minikube for local Kubernetes

## Run application locally

```bash
cd app
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python app.py
```

Open http://127.0.0.1:8080

## Build container

```bash
docker build -t cloud-security-demo:local ./app
docker run --rm -p 8080:8080 cloud-security-demo:local
```

## Security scans

```bash
trivy fs .
trivy image cloud-security-demo:local
gitleaks detect --source . --redact
checkov -d terraform
semgrep scan --config auto app/
```

## Terraform

Review variables and AWS costs before applying:

```bash
cd terraform
terraform init
terraform fmt -check
terraform validate
terraform plan
```

The Terraform examples are intentionally conservative and contain placeholders. Do not commit AWS credentials.

## GitHub

Create an empty GitHub repository, then:

```bash
git init
git branch -M main
git add .
git commit -m "Initial cloud security DevSecOps project"
git remote add origin https://github.com/YOUR_USERNAME/cloud-security-devsecops.git
git push -u origin main
```

## Security notes

Never commit:
- AWS access keys
- private keys
- `.env` files
- passwords/tokens
- Terraform state containing secrets

Use GitHub Actions OIDC with an AWS IAM role for production CI/CD rather than long-lived AWS access keys.

## Project outcome

This project demonstrates secure source control, automated security gates, infrastructure-as-code security, container security, Kubernetes hardening, and AWS security monitoring.
