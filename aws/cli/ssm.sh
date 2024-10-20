#!/bin/bash

# This script is working for AWS instances that have a name tag;
# otherwise, they won't be detected.

target=${1:-false}
env=${2:-false}
number=${3:-false}

HELP="help: ssm [alias] [env] [number]. Example: ssm ticket prod 2"

ALIAS_LIST="[api|ticket|redis|listener|front|scheduler|webchat|jenkins]"
ENV_LIST="[dev|staging|prod]"

[[ $(which aws) ]] && check_aws=0 || check_aws=255;

if [ $check_aws -ne 0 ]; then
    echo "This script has dependency on aws-cli. Please install aws-cli first."
    exit 1;
fi

checkReadParam() {
    param=$1;
    list=$2;

    grep_result=$( echo $list | grep $param );
    [[ $grep_result ]] && result_code=0 || result_code=255;

    # exit script when incorrect input is detected: 비정상적인 입력이 감지되면 종료한다.
    if [ $result_code -ne 0 ]; then
        echo "Incorrect input is detected. Please input value correctly."
        exit 1;
    fi
}

readParams() {

    if [ $target == false ]; then
        echo "Input server alias $ALIAS_LIST >> "
        read target;
        checkReadParam $target $ALIAS_LIST
    fi

    if [ $env == false ]; then
        # for environment.
        echo "Input server env $ENV_LIST >>";
        read env;
        checkReadParam $env $ENV_LIST
    else
        echo -e "ssm $ALIAS_LIST $ENV_LIST [number]? \n"
        exit 0;
    fi
}

if [ $target == false ] || [ $env == false ]; then
    readParams
fi

TOKEN="$target-$env"

INSTNACES=$(aws ec2 describe-instances \
    --filters "Name=tag-key,Values=Name" \
    --query 'Reservations[].Instances[].{Instance:InstanceId,Name:Tags[?Key==`Name`]|[0].Value}' \
    --output text | awk '{ print $1":"$2 }' | grep $TOKEN)

INSTNACES_LENGTH=$( echo $INSTNACES | wc -w)
INSTANCE_ID=false

if [ $INSTNACES_LENGTH -ge 2 ]; then

    ###### receive index from user. ######
    # 원래 readInstanceId function 으로 뺏으나 구성에 실패했다.
    # shell script 상의 문제로 array param 을 받아처리하면서
    # 내부에서 printf / read 명령어를 쓸 떄 제대로 안내문이 출력되지 않는
    # 문제가 있다.
    echo "Multiple instances are detected. SELECT ONE >>"

    printf '%s\n' ${INSTNACES[@]} \
        | awk -F ":" '{ gsub(" ", "\n"); print $2" "$1 };' \
        | cat -n -

    read __INDEX;

    INSTANCE_ID_TOKEN=$( \
        echo ${INSTNACES[@]} \
        | awk '{ gsub(" ", "\n"); print $'$__INDEX' };' \
    );
    ###### receive index END ######
    INSTANCE_ID=$(echo $INSTANCE_ID_TOKEN | awk -F ":" '{ print $1 }')

else
    INSTANCE_ID=$(echo ${INSTNACES[0]} | awk -F ":" '{ print $1 }')
fi

echo "Connecting to $target-$env. INSTANCE_ID: $INSTANCE_ID"

aws ssm start-session --target $INSTANCE_ID