#!/usr/bin/env bash
set -euo pipefail

echo "[1/4] Filesystem scan"
trivy fs .

echo "[2/4] Secret scan"
gitleaks detect --source . --redact

echo "[3/4] IaC scan"
checkov -d terraform

echo "[4/4] SAST"
semgrep scan --config auto app/

echo "Security checks completed."
