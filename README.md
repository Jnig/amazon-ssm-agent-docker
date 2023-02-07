# amazon-ssm-agent-docker

## create secret in kubernetes
```
kubectl -n kube-system create secret generic amazon-ssm-agent --from-literal=SSM_CODE=... --from-literal=SSM_ID=... --from-literal=SSM_REGION=eu-central-1
```

## create daemon set
```
kubectl apply -f https://raw.githubusercontent.com/Jnig/amazon-ssm-agent-docker/main/daemonset.yaml
```
