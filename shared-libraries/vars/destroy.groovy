def call() {
    sh '''
    cd IaC
    terraform destroy -auto-approve
    '''
}