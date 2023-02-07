#!/bin/bash

if [[ -z $SSM_CODE || -z $SSM_ID || -z $SSM_REGION ]]; then
  echo "SSM_CODE, SSM_ID and SSM_REGION must be provided as environment variable"
  exit 1
fi

if [[ ! -f "/var/lib/amazon/ssm/registration" ]]; then
  echo "Registering machine..."
  echo "yes" | amazon-ssm-agent -register -code "$SSM_CODE" -id "$SSM_ID" -region "$SSM_REGION"
fi

amazon-ssm-agent