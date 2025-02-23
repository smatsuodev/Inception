FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y nginx openssl

WORKDIR /etc/nginx/ssl

# generate private key for ca
RUN openssl genrsa 2048 > ca.key
# generate public key for ca
RUN openssl rsa -in ca.key -pubout -out ca-public.key
# generate csr for ca
RUN openssl req -new -key ca.key -subj "/CN=rootca" > ca.csr
# sign csr with private key (self sign)
RUN openssl x509 -req -in ca.csr -signkey ca.key -days 10000 -out ca.crt 

WORKDIR /etc/nginx

COPY ./nginx.conf ./nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
