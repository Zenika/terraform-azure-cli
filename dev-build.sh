#!/usr/bin/env bash

set -eo pipefail

if [ -n "$1" ] && [ -n "$2" ] ; then
  echo "Building images with parameters AZURE_CLI_VERSION=${1} and TERRAFORM_VERSION=${2}"
  docker image build --build-arg AZURE_CLI_VERSION="$1" --build-arg TERRAFORM_VERSION="$2" -f debian.Dockerfile -t zenika/terraform-azure-cli:debian .
  docker image build --build-arg AZURE_CLI_VERSION="$1" --build-arg TERRAFORM_VERSION="$2" -f alpine.Dockerfile -t zenika/terraform-azure-cli:alpine .
else
  echo "Building images with default parameters"
  docker image build -f alpine.Dockerfile -t zenika/terraform-azure-cli:alpine .
  docker image build -f debian.Dockerfile -t zenika/terraform-azure-cli:debian .
fi