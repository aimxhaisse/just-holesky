#!/bin/sh
#
# Starts a local fast-synced geth node.

exec geth \
     --port=20000                       \
     --authrpc.jwtsecret=/jwt.txt       \
     --authrpc.addr=0.0.0.0             \
     --authrpc.vhosts=*                 \
     --datadir=/data                    \
     --http                             \
     --http.addr=0.0.0.0                \
     --http.api=eth,net,web3,debug      \
     --http.corsdomain=*                \
     --http.port=8545                   \
     --http.vhosts=*                    \
     --metrics                          \
     --metrics.addr=0.0.0.0             \
     --ws                               \
     --ws.addr=0.0.0.0                  \
     --ws.api=eth,net,web3              \
     --ws.origins=*                     \
     --ws.port=8545                     \
     --holesky                          \
     --state.scheme=path                \
     --syncmode=snap                    \
     --txlookuplimit=0
