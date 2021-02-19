# Consul

This repository show a bug concerning a secured consul cluster.

## Startup

- Startup servers

    ```Bash
    docker-compose up -d server-1 server-2 server-3
    ```

- Wait some time for server initialisation
- Startup client

    ```Bash
    sleep 30
    docker-compose up -d client-1
    ```

- Check members

    ```Bash
    docker-compose exec server-1 consul members

    # Output
    Node      Address          Status  Type    Build  Protocol  DC     Segment
    server-1  172.29.0.2:8301  alive   server  1.9.3  2         paris  <all>
    server-2  172.29.0.3:8301  alive   server  1.9.3  2         paris  <all>
    server-3  172.29.0.4:8301  alive   server  1.9.3  2         paris  <all>
    client-1  172.29.0.6:8301  alive   client  1.9.3  2         paris  <default>
    ```

## Bug reproduction

- Startup the client turned into a server

    ```Bash
    docker-compose up -d client-2
    ```

- Check members

    ```Bash
    docker-compose exec server-1 consul members

    # Output
    client-2  172.29.0.7:8301  alive   server  1.9.3  2         paris  <all> # <=== WTF is he doing here !!
    server-1  172.29.0.2:8301  alive   server  1.9.3  2         paris  <all>
    server-2  172.29.0.3:8301  alive   server  1.9.3  2         paris  <all>
    server-3  172.29.0.4:8301  alive   server  1.9.3  2         paris  <all>
    client-1  172.29.0.6:8301  alive   client  1.9.3  2         paris  <default>
    ```

    ```Bash
    docker-compose exec client-2 consul members

    # Output
    Node      Address          Status  Type    Build  Protocol  DC     Segment
    client-2  172.29.0.7:8301  alive   server  1.9.3  2         paris  <all>
    server-1  172.29.0.2:8301  alive   server  1.9.3  2         paris  <all>
    server-2  172.29.0.3:8301  alive   server  1.9.3  2         paris  <all>
    server-3  172.29.0.4:8301  alive   server  1.9.3  2         paris  <all>
    client-1  172.29.0.6:8301  alive   client  1.9.3  2         paris  <default>

    # WoW !! He can see everyone !
    ```
