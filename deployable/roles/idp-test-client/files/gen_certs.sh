#!/bin/bash
echo USING ${PKI_PATH}

openssl genrsa -out idp-test-client.key 4096
openssl req -config idp-test-client_tls.conf -key idp-test-client.key -out idp-test-client.csr -new
openssl x509 -req -in idp-test-client.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out idp-test-client.crt -days 10000
