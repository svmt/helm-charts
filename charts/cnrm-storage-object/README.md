# CNRM Storage Object

```bash
helm repo add svmt-github https://svmt.github.io/helm-charts

helm -n demo template my-bucket \
    --set global.projectID=svmt-k8s \
    --set global.servcieAccount.name=chartmuseum \
    svmt-github/storage-object 
```
