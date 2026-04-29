@Library('git-aws-repo@jenkins-terraform') _

pipeline {
    agent any

    parameters {
        choice(
            name: 'region',
            choices: [
                'N. Virginia',
                'Ohio',
                'N. California',
                'Oregon',
                'Mumbai',
                'Singapore',
                'Sydney',
                'Tokyo',
                'Frankfurt',
                'London',
                'Stockholm',
                'São Paulo'
            ],
            description: 'AWS region'
        )
        choice(
            name: 'resource',
            choices: ['vpc', 'instance', 'container', 's3'],
            description: 'Resource type'
        )
        string(name: 'zone', defaultValue: '', description: 'AWS availability zone')
        string(name: 'resource_name', defaultValue: '', description: 'Resource name')
    }

    stages {
        stage('Init Validation') {
            steps {
                script {
                    def missing = []
                    if (!params.region?.trim())        missing << 'region'
                    if (!params.zone?.trim())          missing << 'zone'
                    if (!params.resource?.trim())      missing << 'resource'
                    if (!params.resource_name?.trim()) missing << 'resource_name'

                    if (missing) {
                        error("Missing parameters: ${missing.join(', ')}")
                    }

                    echo "region: ${params.region}"
                    echo "zone: ${params.zone}"
                    echo "resource: ${params.resource}"
                    echo "resource_name: ${params.resource_name}"
                }
            }
        }

        stage('Preparation') {
            steps {
                script {
                    def (regiSel, resSel) = AWSResources(params.region, params.resource)

                    echo "aws_region: ${regiSel}"
                    echo "resource_type: ${resSel}"
                }
            }
        }
    }

    post {
        always {
            script {
                try {
                    cleanWs()
                } catch (ignored) {
                    echo 'cleanWs is unavailable; using deleteDir instead.'
                    deleteDir()
                }
            }
        }
    }
}
