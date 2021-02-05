
# generate certificate
cd /consul/data
rm *.pem
consul tls cert create -server -node server-1 -dc $1 -ca /consul/certs/consul-agent-ca.pem -key /consul/certs/consul-agent-ca-key.pem

# startup
consul agent -config-dir=/consul/config -data-dir=/consul/data
