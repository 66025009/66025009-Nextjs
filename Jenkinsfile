pipeline {
    agent any
    stages {      
        stage("Copy file to Docker server"){
            steps {
                sh "rsync -avz --delete /var/lib/jenkins/workspace/66025009-Nextjs/ root@43.208.253.87:~/66025009-Nextjs"
            }
        }
        
        stage("Build Docker Image") {
            steps {
                ansiblePlaybook(
                    playbook: '/var/lib/jenkins/workspace/66025009-Nextjs/playbooks/build.yaml',
                    inventory: '43.208.253.87:4265,',
                    extras: '--ssh-extra-args="-o StrictHostKeyChecking=no"'
                )
            }    
        } 
        
        stage("Create Docker Container") {
            steps {
                ansiblePlaybook(
                    playbook: '/var/lib/jenkins/workspace/66025009-Nextjs/playbooks/deploy.yaml',
                    inventory: '43.208.253.87:4265,',
                    extras: '--ssh-extra-args="-o StrictHostKeyChecking=no"'
                )
            }    
        } 
    }
}
