#!/bin/bash
#Get TRADA Pool stats
curl https://js.adapools.org/pools/f25197cb96c05ec03b8fc5ef195ea87e76ba8fab3b0dcc0cd499e140/summary.json 2>/dev/null \
| jq '.data | del(.hist_bpe, .handles, .hist_roa, .pool_id_bech32, .db_ticker, .db_name, .db_url, .ticker_orig, .pool_id,  .group_basic, .tax_ratio_old, .tax_fix_old , .direct, .db_description)' \
| tr -d \"{},: \
| awk NF \
| sed -e 's/^[ \t]*/tradapool_/' > /opt/cardano/cnode-docker-compose/exporters/poolstats/tradapools.prom
