#!/bin/bash

if [[ ! -f "/var/lib/amazon/ssm/registration" ]]; then
  echo "yes" | amazon-ssm-agent -register -code "$SSM_CODE" -id "$SSM_ID" -region "$SSM_REGION" 
fi

amazon-ssm-agent
