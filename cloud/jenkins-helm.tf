resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "4.8.3"
  namespace  = kubernetes_namespace.jenkins_namespace.metadata[0].name

  values = [
    file("jenkins/jenkins-helm-values.yaml")
  ]
}