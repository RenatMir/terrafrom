resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "3.6.0"
  namespace  = kubernetes_namespace.jenkins_namespace.metadata[0].name

  values = [
    file("jenkins/jenkins-helm-values.yaml")
  ]
}