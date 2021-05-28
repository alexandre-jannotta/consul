# create
curl http://127.0.0.1:8500/v1/query \
    --request POST \
    --data @- << EOF
{
  "Name": "",
  "Template": {
    "Type": "name_prefix_match"
  },
  "Service": {
    "Service": "\${name.full}",
    "Failover": {
      "NearestN": 1
    }
  }
}
EOF

dig @127.0.0.1 -p 8601 whoami.query.consul

# list
curl http://127.0.0.1:8500/v1/query
# execute
curl http://127.0.0.1:8500/v1/query/60af3f13-53da-6f37-dd59-bae892db7ad7/execute
# delete
curl http://127.0.0.1:8500/v1/query/60af3f13-53da-6f37-dd59-bae892db7ad7 --request DELETE
