def call (String regiSel, String res_sel, String res_na) {
    
    stage('Input Parameters') {
        def regions = [
            'N. Virginia' : 'us-east-1',
            'Ohio'        : 'us-east-2',
            'N. Carolina' : 'us-west-1',
            'Oregon'      : 'us-west-2',
            'Mumbai'      : 'ap-south-1',
            'Singapore'   : 'ap-southeast-1',
            'Sydney'      : 'ap-southeast-1',
            'Tokyo'       : 'ap-northeast-1',
            'Frankfurt'   : 'eu-central-1',
            'London'      : 'eu-west-2',
            'Stockholm'   : 'eu-north-1',
            'São Paulo'   : 'sa-east-1'
        ]
        def resources = [
            vpc       : 'vpc',
            instance  : 'instance',
            container : 'container',
            s3        : 's3'
        ]
    regiSel = regions[params.region] ?: error("unknown region ${params.region}")
    res_sel = resources[params.resource] ?: error("unknown resource ${params.resource}")
    res_na = params.res_name ?: error("resource name is required")
    echo "${regiSel}"
    echo "${res_sel}"
    echo "${res_na}"

    }
}