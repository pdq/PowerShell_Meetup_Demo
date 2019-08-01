pipeline {
    agent { label 'windows && pester' }

    stages {
        stage('Run Pester Tests') {
            steps {
                powershell(label: 'Invoke Pester', script: '.\\Get-TestResults.ps1')
            }
            post {
                always {
                    retry(2) {
                        step([$class: 'JUnitResultArchiver', testResults: 'Tests/testResults.xml'])
                    }
                }
            }
        }
    }
}