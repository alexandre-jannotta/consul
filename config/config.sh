
consul acl policy create \
    -http-addr 'http://server-1:8500' \
    -token 'd8a5fa60-cc67-499b-d363-94128d44b2d1' \
    -name 'client' \
    -rules 'node_prefix "client-" {
  policy = "write"
}'

consul acl token create \
    -http-addr 'http://server-1:8500' \
    -token 'd8a5fa60-cc67-499b-d363-94128d44b2d1' \
    -description 'client' \
    -policy-name 'client' \
    -accessor 'aaab1e0a-d91b-f689-5f71-33b1305c6d2c' \
    -secret '6a414ac2-850f-7921-2ba2-141ee456f966'
