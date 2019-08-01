pipeline {
    agent { label 'windows && pester' }

    stages {
        stage('Run Pester Tests') {
            steps {
                powershell(label: 'Invoke Pester', script: 'Invoke-Pester . -OutputFile ./testResults.xml')
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