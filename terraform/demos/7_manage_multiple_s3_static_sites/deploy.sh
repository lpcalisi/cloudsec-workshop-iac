#!/bin/bash

usage ()
{
  echo 'Usage : host_s3_public_static_site.sh a=<ation> -d=<domain> -t=<tags> -y <creates workspace if not exists>'
  echo 'Usage : host_s3_public_static_site.sh -h <help'
  exit
}

if [ "$#" -eq 0 ]; then
	usage
	exit -1
fi

if [ "$1" == "-h" ]
then
echo "OPTIONS
	-a=<action>: terraform action
	-d=<domain>: domain name
	-t=<tags>: tags for s3 bucket
	-w <creates workspace if not exists>

EXAMPLE
	host_s3_public_static_site.sh -a=apply -d=example.com -t='{"key":"value"}' -w"
exit
fi

for i in "$@"
do
case $i in
	-a=* )
        ACTION="${i#*=}"
        shift
        ;;
	-d=* )
	DOMAIN_NAME="${i#*=}"
	shift
	;;
	-t=* )
	TAGS="${i#*=}"
	shift
	;;
	-w )
	CREATE_WORKSPACE=True
	shift
	;;
	* )
	usage
	;;
esac
done

if [ "$ACTION" != "apply" -a "$ACTION" != "destroy" -a "$ACTION" != "plan" ];
then
	echo "ERROR -a=<action> incorrect value - use help"
	exit -1
fi

pushd terraform
terraform init 2>&1
terraform workspace select ${DOMAIN_NAME}
if [ "$?" -ne 0 ]
then
	if [ $CREATE_WORKSPACE ]
	then
		terraform workspace new ${DOMAIN_NAME}
	else
		echo "[+] Try executing: terraform workspace new ${DOMAIN_NAME} inside terraform folder"
		exit -1
	fi
fi

terraform init
terraform ${ACTION} -var="domain=${DOMAIN_NAME}" -var="tags=${TAGS}"

popd


if [ "$ACTION" == "apply" ]
then
	echo "[+] Sync bucket"
	aws s3 sync --include="*" ${DOMAIN_NAME} s3://${DOMAIN_NAME}/
fi

