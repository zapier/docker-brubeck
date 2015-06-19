#!/bin/bash

STATSD_PORT=${STATSD_PORT-8125}
STATSD_WORKERS=${STATSD_WORKERS-4}
CARBON_ADDRESS=${CARBON_ADDRESS-0.0.0.0}
CARBON_PORT=${CARBON_PORT-2003}

cat config.template.json \
    | jq ".samplers[0].port = ${STATSD_PORT}" \
    | jq ".samplers[0].workers = ${STATSD_WORKERS}" \
    | jq ".backends[0].address = \"${CARBON_ADDRESS}\"" \
    | jq ".backends[0].port = ${CARBON_PORT}" \
    > config.json
