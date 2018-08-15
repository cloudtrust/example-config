#!/bin/bash
echo USING ${PKI_PATH}

openssl genrsa -out keycloak.key 4096
openssl req -config keycloak_tls.conf -key keycloak.key -out keycloak.csr -new
openssl x509 -req -in keycloak.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out keycloak.crt -days 10000
