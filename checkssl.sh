#!/bin/bash

data = `echo | openssl s_client -servername $1 -connect $1:${2:-443} 2>/dev/null | openssl x509 -noout -enddate | sed -e 's#notAfter=##'`

datacertificado = `date -d "${data}" '+%s'`

dataagora = `date '+%s'`

diferenca = "$((${datacertificado}-${dataagora}))"

echo 'Data de Validade:' $data
echo $((${diferenca}/86400)) 'Dias'