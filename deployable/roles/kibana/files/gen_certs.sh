#!/bin/bash
echo USING ${PKI_PATH}

openssl genrsa -out kibana.key 4096
openssl req -config kibana_tls.conf -key kibana.key -out kibana.csr -new
openssl x509 -req -in kibana.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out kibana.crt -days 10000
