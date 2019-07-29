pipeline {
    agent {any}
    
    stages {
        stage('Run Pester Tests') {
            steps {
                powershell(label: 'Invoke Pester', script: 'Invoke-Pester . -OutputFile ./testResults.xml -OutputFormat NUnitXml')
            }
        }
        post {
            always {
                step([$class: 'JUnitResultArchiver', testResults: './testResults.xml'])
            }
        }
    }
}