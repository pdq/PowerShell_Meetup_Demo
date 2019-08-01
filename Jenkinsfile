pipeline {
    agent { label 'windows && pester' }

    stages {
        stage('Run Pester Tests') {
            steps {
                // powershell(label: 'Invoke Pester', script: 'Invoke-Pester . -OutputFile ./testResults.xml')
                powershell(label: 'fake news' script: "Write-Host 'Hi there!'")
            }
            post {
                always {
                    retry(2) {
                        step([$class: 'JUnitResultArchiver', testResults: './testResults.xml'])
                    }
                }
            }
        }
    }
}