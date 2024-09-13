_default:
    @just --list --unsorted

# Show the current status of the L1 stack
ps:
    docker compose ps

# Start/restart the L1 stack
restart:
    [ -f jwt.txt ] || (openssl rand -hex 32 > jwt.txt)
    [ -d geth-data ] || mkdir geth-data
    [ -d lighthouse-data ] || mkdir lighthouse-data

    docker compose up -d

# Start the L1 stack
alias start := restart

# Stop the L1 stack
stop:
    docker compose stop

# Show logs of the L1 stack
logs:
    docker compose logs

# Removes the L1 stack
rm: stop
    #!/usr/bin/env bash
    docker compose rm -f
    sudo rm -rf ./lighthouse-data/
    sudo rm -rf ./geth-data/

# Shows the status of the L1 stack
status:
    #!/usr/bin/env bash
    echo "Geth status"
    echo "==========="
    echo web3.eth.syncing | docker compose exec -T geth geth attach --datadir /data  | grep currentBlock | sed 's/.*currentBlock: \(.*\),/Block: \1/'
    echo ""
    echo "Lighthouse status"
    echo "================="
    echo "Slot: $(curl -s http://localhost:5052/eth/v1/beacon/headers | jq '.data[0].header.message.slot')"
