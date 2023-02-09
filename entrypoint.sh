#!/bin/bash

if [[ -z $SSM_CODE || -z $SSM_ID || -z $SSM_REGION ]]; then
  echo "SSM_CODE, SSM_ID and SSM_REGION must be provided as environment variable"
  exit 1
fi

mkdir -p /host/opt/amazon/bin/ || echo "/opt/amazon/bin/ already exists..."

cp /usr/bin/amazon-ssm-agent /host/opt/amazon/bin/
cp /usr/bin/ssm-* /host/opt/amazon/bin/
cp amazon-ssm-agent.service /host/etc/systemd/system/

cat > /host/opt/amazon/bin/amazon-ssm-init.sh <<EOF
#!/bin/bash

export SSM_ID=$SSM_ID
export SSM_REGION=$SSM_REGION
export SSM_CODE=$SSM_CODE

if [[ ! -f "/var/lib/amazon/ssm/registration" ]]; then
  echo "Registering machine..."
  echo "yes" | /opt/amazon/bin/amazon-ssm-agent -register -code "$SSM_CODE" -id "$SSM_ID" -region "$SSM_REGION"
fi
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent
EOF

chmod +x /host/opt/amazon/bin/amazon-ssm-init.sh
chroot /host/ /opt/amazon/bin/amazon-ssm-init.sh

tail -f /host/var/log/amazon/ssm/amazon-ssm-agent.log
