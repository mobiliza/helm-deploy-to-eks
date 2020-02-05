#!/bin/sh -l

echo "Will deploy to EKS"

export KUBECONFIG=/root/.kube/config
aws eks --region $CLUSTER_REGION update-kubeconfig --name $CLUSTER_NAME

echo "Deploying version $VERSION to $ENVIRONMENT environment"

helm -n $ENVIRONMENT --set ci.version=$VERSION upgrade --install $PROJECT ./chart