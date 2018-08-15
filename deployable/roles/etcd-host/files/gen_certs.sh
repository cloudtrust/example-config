#!/bin/bash

echo "Server keys"
openssl genrsa -out etcd_server.key 4096
openssl req -config etcd_server_tls.conf -key etcd_server.key -out etcd_server.csr -new
openssl x509 -extfile etcd_server_tls.conf -extensions etcd_server -req -in etcd_server.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out etcd_server.crt -days 10000

echo "Peer keys"
openssl genrsa -out etcd_peer.key 4096
openssl req -config etcd_peer_tls.conf -key etcd_peer.key -out etcd_peer.csr -new
openssl x509 -extfile etcd_peer_tls.conf -extensions etcd_peer -req -in etcd_peer.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out etcd_peer.crt -days 10000

echo "Client keys"
openssl genrsa -out etcd_client.key 4096
openssl req -config etcd_client_tls.conf -key etcd_client.key -out etcd_client.csr -new
openssl x509 -extfile etcd_client_tls.conf -extensions etcd_client -req -in etcd_client.csr -CA ${PKI_PATH}/ca.crt -CAkey ${PKI_PATH}/ca.key -CAcreateserial -out etcd_client.crt -days 10000
