#! /bin/bash
#
# Starts a beacon node.

exec lighthouse                         \
     beacon_node                        \
     --datadir=/data                    \
     --staking                          \
     --execution-jwt=/jwt.txt           \
     --metrics                          \
     --metrics-address=0.0.0.0          \
     --http                             \
     --http-address=0.0.0.0             \
     --disable-upnp                     \
     --validator-monitor-auto           \
     --port=10010                       \
     --discovery-port=10010             \
     --enr-udp-port=10010               \
     --quic-port=10011                  \
     --enr-quic-port=10011              \
     --checkpoint-sync-url=https://beaconstate-holesky.chainsafe.io    \
     --disable-backfill-rate-limiting                                  \
     --execution-endpoint=http://geth:8551                             \
     --genesis-backfill                \
     --network=holesky                 \
     --reconstruct-historic-states
