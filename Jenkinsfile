pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven 'maven-3.8'
    }

    stages {
        stage('Build jar') {
            steps {               
                sh "mvn package"               
            }     
        }
     
        stage('Build image') {
            steps {               
                echo "building image"
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'myPass', usernameVariable: 'myUser')])
                    sh 'docker build -t victorcicd/k8sphp:v5 .'
                    sh "echo $PASS | docker login -u $myUser --password-stdin"
                    sh 'docker push victorcicd/k8sphp:v5'
                }
            }
        }
        stage('Build deploy over SSH') {
            steps {
                echo "deploy"
               // def dockerC = 'docker run
               // sshagent(['ec2-server-key']) {
                //    sh "ssh -o StrictHostKeyChecking=no ubuntu@10.0.10.149"               
                }
            }
        }
    }
}
