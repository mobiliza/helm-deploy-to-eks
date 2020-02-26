# HELM Deploy to EKS Docker Action

This action authenticates with your eks cluster and deploys helm chart located at `./chart`.

## Inputs

### `eks-cluster-name`

**Required** The Name of EKS Cluster. Can be viewed running `$ eksctl get cluster`.

### `eks-cluster-region`

**Required** The AWS Region of EKS Cluster. Can be viewed running `$ eksctl get cluster`.

### `eks-cluster-accesskey`

**Required** An AWS ACCESS KEY with enough permissions to `$ kubectl apply` successfully.

### `eks-cluster-secretkey`

**Required** An AWS SECRET KEY with enough permissions to `$ kubectl apply` successfully.

### `helm-release`

**Required** The helm release name.

### `namespace`

**Required** Kubernetes namespace to install/upgrade your Helm chart. Default `"default"`.

### `set-values`

**Required** Values to be `--set` during `helm upgrade` command. 

## Example usage

```
uses: mobiliza/helm-deploy-to-eks@v1
with:
  eks-cluster-accesskey: ${{ secrets.AWS_ACCESS_KEY_ID }}
  eks-cluster-secretkey: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  eks-cluster-region: sa-east-1
  eks-cluster-name: eks-foobar
  helm-release: foobar
  namespace: production
  set-values: |
    version=${{ github.sha }}
```