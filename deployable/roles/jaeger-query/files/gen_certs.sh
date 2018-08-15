#!/bin/bash
echo USING ${PKI_PATH}

openssl genrsa -out jaeger.key 4096
openssl req -config jaeger_tls.conf -key jaeger.key -out jaeger.csr -new
openssl x509 -req -in jaeger.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out jaeger.crt -days 10000
