# create
curl http://127.0.0.1:8500/v1/query \
    --request POST \
    --data @- << EOF
{
  "Name": "whoami",
  "Service": {
    "Service": "whoami",
    "Failover": {
      "Datacenters": ["seclin"]
    }
  }
}
EOF

# list
curl http://127.0.0.1:8500/v1/query
# execute
curl http://127.0.0.1:8500/v1/query/abb68427-44eb-d189-4223-8cf290497693/execute
# delete
curl http://127.0.0.1:8500/v1/query/abb68427-44eb-d189-4223-8cf290497693 --request DELETE
