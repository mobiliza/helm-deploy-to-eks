#!/bin/sh -l

# $1: inputs.eks_cluster_accesskey
# $2: inputs.eks_cluster_secretkey
# $3: inputs.eks_cluster_region
# $4: inputs.eks_cluster_name
# $5: inputs.namespace
# $6: inputs.helm_release
# $7: inputs.set_values

echo "Checking ENV"

printenv

echo "Coonects to EKS"

export AWS_ACCESS_KEY_ID=$INPUT_EKS_CLUSTER_ACCESSKEY
export AWS_SECRET_ACCESS_KEY=$INPUT_EKS_CLUSTER_ACCESSKEY
export KUBECONFIG=/root/.kube/config
aws eks --region $INPUT_CLUSTER_REGION update-kubeconfig --name $INPUT_CLUSTER_NAME

echo "Deploying version to $INPUT_NAMESPACE environment with:"

setValues=$(printf " --set %s" $INPUT_SET_VALUES)
echo "helm -n $INPUT_NAMESPACE upgrade --install $INPUT_HELM_RELEASE .helm --reuse-values $setValues"
eval "helm -n $INPUT_NAMESPACE upgrade --install $INPUT_HELM_RELEASE .helm --reuse-values $setValues"