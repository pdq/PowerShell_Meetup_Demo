pipeline {
    agent { label 'windows' }

    stages {
        stage('Run Pester Tests') {
            steps {
                powershell(label: 'Invoke Pester', script: 'Invoke-Pester')
            }
        }
    }
}