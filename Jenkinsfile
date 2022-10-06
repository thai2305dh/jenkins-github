pipeline{
    agent any
    environment {
      DOCKER_TAG = getImage()
    }
    stages{
        stage('SCM'){
            steps{
                git credentialsId: 'thaigithub', 
                    url: 'https://github.com/thai2305dh/jenkins-github.git'
            }
        }
         
        stage('Docker Build'){
            steps{
                sh "docker build . -t thai2305/gitlab:${DOCKER_TAG} "
            }
        }
        
        stage('DockerHub Push'){
            steps{
                withCredentials([string(credentialsId: 'dockerhub2', variable: 'dockerHubPwd')]) {
                    sh "docker login -u thai2305 -p ${dockerHubPwd}"
                }
                
                sh "docker push thai2305/gitlab:${DOCKER_TAG} "
            }
        }
        
        stage('Docker Deploy'){
            steps{
              ansiblePlaybook credentialsId: 'sshkey', disableHostKeyChecking: true, extras: "-e DOCKER_TAG=${DOCKER_TAG}", installation: 'ansible', inventory: 'hosts', playbook: 'playbook.yml'
            }
        }
    }
}

def getImage(){
    def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}

