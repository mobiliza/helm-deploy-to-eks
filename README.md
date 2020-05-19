# HELM Deploy to EKS Docker Action

This action authenticates with your eks cluster and deploys helm chart located at `./chart`.

## Inputs

### `helm-release`

**Required** The helm release name.

### `namespace`

**Required** Kubernetes namespace to install/upgrade your Helm chart. Default `"default"`.

### `set-values`

**Required** Values to be `--set` during `helm upgrade` command. 

## Env

### AWS_ACCESS_KEY_ID

### AWS_SECRET_ACCESS_KEY

### CLUSTER_REGION

### CLUSTER_NAME

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