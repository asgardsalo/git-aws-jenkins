def call (String regiSel, String res_sel, String res_na) {

    stage('Input Parameters') {
        switch (params.region) {
            case 'N. Virginia':
                regiSel='us-east-1'
            break
            case 'Ohio':
                regiSel='us-east-1'
            break
            case 'N. Carolina':
                regiSel='us-west-1'
            break
            case 'Oregon':
                regiSel='us-west-2'
            break
            case 'Mumbai':
                regiSel='ap-south-1'
            break
            case 'Singapore':
                regiSel='ap-southeast-1'
            break
            case 'Sydney':
                regiSel='ap-southeast-1'
            break
            case 'Tokyo':
                regiSel='ap-northeast-1'
            break
            case 'Frankfurt':
                regiSel='eu-central-1'
            break
            case 'London':
                regiSel='eu-west-2'
            break
            case 'Stockholm':
                regiSel='eu-north-1'
            break
            case 'São Paulo':
                regiSel='sa-east-1'
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
echo "${res_na}"

