#!/bin/bash
echo USING ${PKI_PATH}

openssl genrsa -out kube_server.key 4096
openssl req -config kube_server_tls.conf -key kube_server.key -out kube_server.csr -new
openssl x509 -extfile kube_server_tls.conf -extensions kube_server -req -in kube_server.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out kube_server.crt -days 10000

openssl genrsa -out kube_client_admin.key 4096
openssl req -config kube_client_admin_tls.conf -key kube_client_admin.key -out kube_client_admin.csr -new
openssl x509 -req -in kube_client_admin.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out kube_client_admin.crt -days 10000
