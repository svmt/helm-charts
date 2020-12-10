# CNRM Storage Object

```bash
helm repo add svmt-github https://svmt.github.io/helm-charts

BUCKET="my-bucket"
PROJECT="svmt-k8s"
$SERVICE_ACCOUNT="chartmuseum"

helm -n demo template $BUCKET \
    --set global.projectID=$PROJECT \
    --set global.servcieAccount.create=true \
    --set global.servcieAccount.name=$SERVICE_ACCOUNT \
    svmt-github/storage-object 
```
