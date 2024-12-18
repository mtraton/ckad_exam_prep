#!/bin/sh

kubectl get cm config -o json | jq -r '.data.foo' |  grep 