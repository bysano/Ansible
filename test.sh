#!/usr/bin/bash
base_dir=$(pwd)
vnfid=$(cat definitions/PaloAlto.yaml  | grep vnfdId | cut -f2- -d: | tr -d '\012\015')
echo $vnfid
zip -r "${vnfid}.zip" . -i /definitions/* /implementation/* /TOSCA-Metadata/*
curl -X POST --header "Content-Type:multipart/form-data" -F "file=@/test/${vnfid}.zip" "http://10.229.90.113:8080/nfv-catalog/api/v1/packages" -D -