#!/bin/bash
echo USING ${PKI_PATH}

openssl genrsa -out sentry.key 4096
openssl req -config sentry_tls.conf -key sentry.key -out sentry.csr -new
openssl x509 -req -in sentry.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out sentry.crt -days 10000
