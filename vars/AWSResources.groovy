def call (String regiSel, String res_sel) {

    stage('Input Parameters') {
        switch (params.region) {
            case 'N. Virginia':
                regiSel='us-east-1'
            break
            case 'apac':
                regiSel='us-east-1'
            break
            case 'europe':
                regiSel='us-east-1'
            break
            case 'São Paulo':
                regiSel='us-east-1'
            break
        }
        switch (params.resource) {
            case 'vpc':
                res_sel='vpc'
            break
            case 'instance':
                res_sel='instance'
            break
            case 'container':
                res_sel='container'
            break
            case 's3':
                res_sel='s3'
            break
        }
    }
echo "${regiSel}"
echo "${res_sel}"

/*// Define the parameters for the pipeline
    stage('Variable Creation') {
        
        params = [
            region: regiSel
            resource: res_sel
        ]
        map(params, 'region', 'resource', vpc_name: 'vpc-jenkins', subnet_name: 'subnet-jenkins', security_group_name: 'sg-jenkins', instance_type: 't2.micro', ami_id: 'ami-12345678')
        echo "Parameters set: ${params}"
    }

    stage('Change Region') {
        sh "export PATH=$PATH:/usr/local/bin"
        sh "/usr/local/bin/aws configure set region ${regiSel}"
        sh "/usr/local/bin/aws configure list"         
    } */
}