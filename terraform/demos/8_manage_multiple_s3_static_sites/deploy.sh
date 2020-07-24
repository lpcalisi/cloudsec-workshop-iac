#!/bin/bash

usage ()
{
  echo 'Usage : host_s3_public_static_site.sh a=<ation> -d=<domain> -t=<tags>'
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

EXAMPLE
	host_s3_public_static_site.sh -a=apply -d=example.com -t='{"key":"value"}'"
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
terraform workspace select ${DOMAIN_NAME}
if [ "$?" -ne 0 ]
then
	echo "[+] Try executing: terraform workspace new ${DOMAIN_NAME} inside terraform folder"
	exit -1
fi
terraform init
terraform ${ACTION} -var="domain=${DOMAIN_NAME}" -var="tags=${TAGS}"

popd


if [ "$ACTION" == "apply" ]
then
	echo "[+] Sync bucket"
	aws s3 sync --include="*" ${DOMAIN_NAME} s3://${DOMAIN_NAME}/
fi

