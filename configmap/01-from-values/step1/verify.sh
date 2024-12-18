#!/bin/sh

kubectl get cm config -o json | jq -r '.data.foo' |  grep lala && kubectl get cm config -o json | jq -r '.data.foo2' | grep lolo