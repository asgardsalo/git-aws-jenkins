def call(String region, String resource) {
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

    def regiSel = regions[region]
    if (!regiSel) {
        error "Unknown region: ${region}"
    }

    def res_sel = resources[resource]
    if (!res_sel) {
        error "Unknown resource: ${resource}"
    }
}