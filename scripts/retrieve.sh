#!/bin/sh

if [ -z "$1" ]
then
    echo "USAGE: $0 <record nr> <xml or json>"
    exit 1
fi

NR=$1

EXT=$2
if [ -z "$EXT" ]
then
    EXT="xml"
fi

curl -H 'Authorization: Bearer foobar' -H 'Content-Type: application/json' -XGET http://localhost:1210/app/stalling/profile/clarin.eu:cr1:p_1708423613607/record/$NR.$EXT
