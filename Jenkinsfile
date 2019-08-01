pipeline {
    agent { label 'windows && pester' }

    stages {
        stage('Run Pester Tests') {
            steps {
                powershell(label: 'Invoke Pester', script: 'Invoke-Pester')
            }
        }
    }
}