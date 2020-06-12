# SVMT helm-charts repo

### Add helm repo

```bash
$ helm repo add svmt https://svmt.github.io/helm-charts
"svmt" has been added to your repositories

$ helm repo ls
NAME        	URL                                              
svmt        	https://svmt.github.io/helm-charts   
```

### Install example package with Helm 3

Install nginx chart from svmt repo using helm upgrade action with `-i` flag to force install when missing 

```bash
$ helm repo update
$ helm upgrade -i nginx-svmt svmt/nginx
Release "nginx-svmt" does not exist. Installing it now.
NAME: nginx-svmt
LAST DEPLOYED: Fri Jun 12 16:21:56 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=nginx,app.kubernetes.io/instance=nginx-svmt" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace default port-forward $POD_NAME 8080:80

$ kubectl get po -w
NAME                         READY   STATUS              RESTARTS   AGE
nginx-svmt-9cc497959-ztwbj   0/1     ContainerCreating   0          3s
nginx-svmt-9cc497959-ztwbj   1/1     Running             0          10s
```

### Clean up
```bash
$ helm delete nginx-svmt 
release "nginx-svmt" uninstalled
```