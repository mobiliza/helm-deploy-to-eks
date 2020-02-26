#!/bin/bash -l

# $1: {{ inputs.eks-cluster-accesskey }}
# $2: {{ secrets.eks-cluster-secretkey }}
# $3: {{ inputs.eks-cluster-region }}
# $4: {{ inputs.eks-cluster-name }}
# $5: {{ inputs.namespace }}
# $6: {{ inputs.helm-release }}
# $7: {{ inputs.set-values }}

echo "Will deploy to EKS"

AWS_ACCESS_KEY_ID=$1
AWS_SECRET_ACCESS_KEY=$2

export KUBECONFIG=/root/.kube/config
aws eks --region $3 update-kubeconfig --name $4

echo "Deploying version to $5 environment with:"

setValues=$(printf " --set %s" $7)
echo "helm -n $5 upgrade --install $6 .helm --reuse-values $setValues"
eval "helm -n $5 upgrade --install $6 .helm --reuse-values $setValues"