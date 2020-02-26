#!/bin/bash -l

echo "Will deploy to EKS"

export KUBECONFIG=/root/.kube/config
aws eks --region $INPUT_EKS-CLUSTER-REGION  update-kubeconfig --name $INPUT_EKS-CLUSTER-NAME 

echo "Deploying version to $ENVIRONMENT environment with:"

setValues=$(printf " --set %s" $SET_VALUES)
echo "helm -n $ENVIRONMENT upgrade --install $PROJECT .helm --reuse-values $setValues"
eval "helm -n $ENVIRONMENT upgrade --install $PROJECT .helm --reuse-values $setValues"