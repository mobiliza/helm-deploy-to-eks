# HELM Deploy to EKS Docker Action

This action authenticates with your eks cluster and deploys helm chart located at `./chart`.

## Env

### `AWS_ACCESS_KEY_ID`

**Required** It is what it says. Recommend to use Github Secrets.

### `AWS_SECRET_ACCESS_KEY`

**Required** It is what it says. Recommend to use Github Secrets.

### `CLUSTER_REGION`

**Required** The AWS region where your EKS kubernetes cluster is located.

### `CLUSTER_NAME`

**Required** Your cluster EKS name.

### `VERSION`

**Required** Tag used on your configurated deployment.yaml image. Default `"latest"`.

### `ENVIRONMENT`

**Required** Kubernetes namespace to install your Helm chart. Default `"default"`.

### `PROJECT`

**Required** Helm installation name.

## Example usage

```
uses: mobiliza/helm-deploy-to-eks
env:
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  CLUSTER_REGION: sa-east-1
  CLUSTER_NAME: eks-foobar
  VERSION: ${{ github.sha }}
  ENVIRONMENT: production
  PROJECT: foobar
```