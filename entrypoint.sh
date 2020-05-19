#!/bin/sh -l

echo "Connects to EKS"

export KUBECONFIG=/root/.kube/config
aws eks --region $CLUSTER_REGION update-kubeconfig --name $CLUSTER_NAME

echo "Fetch current helm values.yaml"

helm -n $INPUT_NAMESPACE get values $INPUT_HELM_RELEASE > previousValues.yaml

echo "Previous Values feched"

echo "Deploying version to $INPUT_NAMESPACE environment with:"

setValues=$(printf " --set %s" $INPUT_SET_VALUES)
echo "helm -n $INPUT_NAMESPACE upgrade --install $INPUT_HELM_RELEASE .helm -f previousValues.yaml $setValues"
eval "helm -n $INPUT_NAMESPACE upgrade --install $INPUT_HELM_RELEASE .helm -f previousValues.yaml $setValues"

echo "Deploy rollout started"