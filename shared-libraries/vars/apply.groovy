def call() {
    sh '''
    cd IaC
    terraform apply -auto-approve
    '''
}