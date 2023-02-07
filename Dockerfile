FROM amazonlinux:2022

RUN yum install -y systemd sudo procps
RUN yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]