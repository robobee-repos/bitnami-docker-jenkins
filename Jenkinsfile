/**
 * Builds and deploys the project.
 *
 * @author Erwin Mueller, erwin@muellerpublic.de
 * @since 1.0.0
 */

def registryHost = "harbor.anrisoftware.com"
def registryName = "robobeerun"
def harborLink = "https://harbor.anrisoftware.com/harbor/projects/2/repositories"

def imageName = "bitnami-docker-jenkins-2.346.2-debian-11-r6"
def imageVersion = "1.1.0"
def imageVersionSnapshot = "${imageVersion}-SNAPSHOT"
def destination = "${registryHost}/${registryName}/${imageName}:${imageVersion}"
def destinationSnapshot = "${destination}-SNAPSHOT"
def fromImage = "${registryHost}/proxycache/bitnami/minideb:bullseye"
def currentTag
def currentVersion

pipeline {

    options {
      buildDiscarder(logRotator(numToKeepStr: "3"))
      disableConcurrentBuilds()
      timeout(time: 60, unit: "MINUTES")
    }

    agent {
        label "buildah"
    }

    stages {
        /**
        * Checkouts the current branch.
        */
        stage("Checkout") {
            steps {
                container("buildah") {
                    checkout scm
                }
            }
        }

        /**
        * Setups the build.
        */
        stage("Setup") {
            steps {
                script {
                    if (GIT_BRANCH == "main") {
                        currentTag = destination
                        currentVersion = imageVersion
                    } else {
                        currentTag = destinationSnapshot
                        currentVersion = imageVersionSnapshot
                    }
                }
            }
        }

        /**
        * Builds the image.
        */
        stage("Build") {
            steps {
                container(name: "buildah") {
                    sh "sed -ie 's!^FROM .*!FROM ${fromImage}!g' `pwd`/Dockerfile && buildah build --storage-driver vfs --no-cache -f Dockerfile --tag ${currentTag} `pwd`/2/debian-11"
                }
            }
        }

        /**
        * Pushs the image.
        */
        stage("Push") {
            steps {
                container(name: "buildah") {
                    sh "buildah push --storage-driver vfs ${currentTag}"
                }
            }
        }
    }

    post {
        success {
            script {
                manager.createSummary("document.png").appendText("<a href='${harborLink}/jenkins-base/artifacts/${currentVersion}'>${currentTag}</a>", false)
            }
        }
    }
}
