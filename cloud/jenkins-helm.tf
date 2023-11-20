resource "helm_release" "jenkins" {
  name = "jenkins"
  chart = "jenkins"
  repository = "https://github.com/jenkinsci/helm-charts/tree/main/charts/jenkins"
  namespace = kubernetes_namespace.jenkins_namespace.metadata[0].name

  values = [
    file("jenkins/jenkins-helm-values.yaml")
  ]
}

#resource "kubernetes_config_map" "jcasc" {
#  metadata {
#    name = "jcasc"
#    labels = {
#      jenkins-jenkins-config = "true"
#    }
#    namespace = "jenkins"
#  }
#
#  data = {
#    "main.yaml" = file("jcasc/main.yaml")
#    "kubernetes.yaml" = file("jcasc/kubernetes.yaml"),
#    "pipeline.yaml" = file("jcasc/job.yaml")
#  }
#}