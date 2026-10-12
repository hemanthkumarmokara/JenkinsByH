
pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Source code checked out successfully.'
            }
        }

        stage('Validate') {
            steps {
                sh '''
                    set -eu

                    test -s site/index.html
                    test -s site/style.css
                    test -s site/script.js
                    test -s tests/test-site.sh

                    echo "All required files exist."
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    set -eu
                    chmod +x tests/test-site.sh
                    bash tests/test-site.sh
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                    set -eu

                    rm -rf dist
                    mkdir -p dist
                    cp -r site/. dist/

                    test -s dist/index.html
                    echo "Website build completed."
                '''
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts(
                    artifacts: 'dist/**',
                    fingerprint: true
                )
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: Portfolio CI pipeline completed!'
        }

        failure {
            echo 'FAILED: Check the Console Output for errors.'
        }

        always {
            echo 'Pipeline execution finished.'
        }
    }
}
