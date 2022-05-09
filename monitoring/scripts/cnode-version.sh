#!/bin/bash
#cardano-node version
#cardano-node 1.34.1 - linux-x86_64 - ghc-8.10
#git rev 73f9a746362695dc2cb63ba757fbcabb81733d23

container_name="$(docker ps --format '{{.Names}}')"

version="$(docker exec -ti ${container_name} cardano-node version)"
cnode_version="$(grep "cardano-node" <<< ${version} \
| cut -d ' ' -f2)"
cnode_version="cnode_version=\"${cnode_version}\""

git_rev="$(docker exec -ti ${container_name} cardano-node version)"
cnode_git_rev="$(grep "git rev" <<< ${git_rev} \
| cut -d ' ' -f3 \
| cut -c1-8)"
cnode_git_rev="cnode_git_rev=\"${cnode_git_rev}\""

pram="info{${cnode_version},${cnode_git_rev}} 1"

# export to .prom file
printf '%s\n' "${pram}" \
| sed -e "s/^[ \t]*/${container_name}_/" > "/opt/cardano/cnode/monitoring/exporters/pool-stats/${container_name}.prom"
