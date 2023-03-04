#!/bin/bash

./create-vpc.yml -e "@examples/private-vars.yml"

./create-security.yml -e "@examples/private-vars.yml"

./create-instance.yml -e "@examples/private-vars.yml"

./update-dns.yml -e "@examples/private-vars.yml"