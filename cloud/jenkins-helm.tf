resource "helm_release" "jenkins" {
  provider = helm.primary

  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "3.6.0"
  namespace  = "jenkins"
  timeout    = 600
  values = [
    file("jenkins/jenkins-helm-values.yaml")
  ]

  depends_on = [
    kubernetes_namespace.jenkins_namespace,
  ]
}