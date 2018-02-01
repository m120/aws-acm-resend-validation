#!/usr/bin/env bash

#set -o errexit
set -o pipefail

## Profile list (どうにかする)
profiles=$(awk '/\[/{print $1}' ~/.aws/credentials | sed -e "s/\\[//g" -e "s/\\]//g")
export profiles

## Execute
for profile in ${profiles};do
  cert_lists=$(aws --prof "${profile}" --output text acm list-certificates --certificate-statuses PENDING_VALIDATION --query 'CertificateSummaryList'| awk '{print $1","$2}')

  if [[ -n ${cert_lists} ]]; then
    echo
    echo "Profile: <<<< ${profile} >>>>>"
      for cert_list in ${cert_lists};do
        domain=$(echo "${cert_list}" |awk -F, '{print $2}')
        cert_arn=$(echo "${cert_list}" |awk -F, '{print $1}')
        echo "Domain: ${domain}"
        echo "CertARN: ${cert_arn}"

        aws --prof "${profile}" acm resend-validation-email --certificate-arn "${cert_arn}" --domain "${domain}" --validation-domain "${domain}"
        echo
      done
  fi
done
