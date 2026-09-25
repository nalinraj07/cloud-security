#!/usr/bin/env bash
set -euo pipefail

aws sts get-caller-identity
aws cloudtrail describe-trails --output table
aws guardduty list-detectors --output table
aws securityhub get-enabled-standards --output table
