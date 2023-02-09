# amazon-ssm-agent-docker

## create secret in kubernetes
```
kubectl -n kube-system create secret generic amazon-ssm-agent --from-literal=ssm_code=... --from-literal=ssm_id=... --from-literal=ssm_region=eu-central-1
```

## create daemon set
```
kubectl apply -f https://raw.githubusercontent.com/Jnig/amazon-ssm-agent-docker/main/daemonset.yaml
```
