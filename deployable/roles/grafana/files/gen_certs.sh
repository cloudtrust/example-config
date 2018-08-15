#!/bin/bash
echo USING ${PKI_PATH}

openssl genrsa -out grafana.key 4096
openssl req -config grafana_tls.conf -key grafana.key -out grafana.csr -new
openssl x509 -req -in grafana.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out grafana.crt -days 10000
