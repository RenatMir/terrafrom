resource "helm_release" "jenkins" {
  name       = "jenkins"
  chart      = "./charts/jenkins"
  namespace  = kubernetes_namespace.jenkins_namespace.metadata[0].name

  values = [
    file("jenkins-helm-values.yaml")
  ]
}