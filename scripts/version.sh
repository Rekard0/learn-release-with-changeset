#!/usr/bin/env bash

set -euo pipefail

# Define the mapping as an associative array
mapping="contracts:@sarkawt/sarkawt-contracts-monorepo configs:@sarkawt/sarkawt-configs-monorepo"

package="${REF_NAME##*-}"

echo $REF_NAME
echo $package

echo "Looping through keys and values:"

for pair in $mapping; do
    key="${pair%%:*}"
    value="${pair#*:}"

    if [[ "$key" != "$package" ]]; then
        changeset version --ignore $value
    fi
done

