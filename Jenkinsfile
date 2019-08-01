pipeline {
    agent { label 'windows && pester' }

    stages {
        stage('Run Pester Tests') {
            steps {
                powershell(label: 'Invoke Pester', script: 'Invoke-Pester . -OutputFile ./testResults.xml -OutputFormat NUnitXml')
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