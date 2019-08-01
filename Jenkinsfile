pipeline {
    agent { label 'windows && pester' }

    stages {
        stage('Run Pester Tests') {
            steps {
                powershell(label: 'Invoke Pester', script: '.\\Get-TestResults.ps1')
            }
            post {
                always {
                    step([$class: 'JUnitResultArchiver', testResults: 'testResults.xml'])
                }
            }
        }
    }
}