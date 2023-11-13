resource "kubernetes_namespace" "jenkins_namespace" {
  metadata {
    name = "jenkins"
  }
}
