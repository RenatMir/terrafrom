## Deploy Jenkins to K8s with Terraform and Helm

### Locally

1) Check that terraform and kubectl is installed and minikube is running
2) `cd local`
3) `terraform init`
4) `terraform plan`
5) `terraform apply`
6) `kubectl port-forward -n jenkins svc/jenkins 8080:8080`

To delete: `terraform destroy`