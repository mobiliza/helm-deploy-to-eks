#!/bin/sh -l

echo "Will deploy to EKS"

export KUBECONFIG=/root/.kube/config
aws eks --region $CLUSTER_REGION update-kubeconfig --name $CLUSTER_NAME

echo "Deploying version to $ENVIRONMENT environment with:"

setValues=$(printf " --set %s" $SET_VALUES)
echo "helm -n $ENVIRONMENT upgrade --install $PROJECT .helm --reuse-values $setValues"
eval "helm -n $ENVIRONMENT upgrade --install $PROJECT .helm --reuse-values $setValues"