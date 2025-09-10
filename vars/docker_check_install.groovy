def call () {

    stage('Check Docker') {
        // Check if docker exists and is running
        def isRunning = sh(
            script: "pgrep -f com.docker.backend >/dev/null && echo yes || echo no",
            returnStdout: true
            ).trim()

        if (isRunning == "no") {
            echo "Starting Docker Desktop..."
            sh "open -a Docker"
            // Wait until daemon is ready
            timeout(time: 60, unit: 'SECONDS') {
                waitUntil {
                    def ready = sh(
                        script: "docker system info >/dev/null 2>&1 && echo yes || echo no",
                        returnStdout: true
                    ).trim()
                    return (ready == "yes")
                }
            }
        } else {
            echo "Docker Desktop already running."
        }
    }
    stage('Verify Docker Running') {
        steps {
            script {
                sh "sudo systemctl status docker || echo '⚠️ Docker might not be running'"
                sh "docker ps || echo '⚠️ Docker command failed'"
            }
        }
    }
    post {
        failure {
            echo "Error"
        }
        always {
            cleanWs()
        }
    }
}