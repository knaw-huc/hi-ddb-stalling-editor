#!/bin/sh

if [ -z "$1" ] | [ -z "$2" ] | [ -z "$3" ]
then
    echo "USAGE: $0 <record nr> <epoch of version to update> <update.json>"
    exit 1
fi

NR=$1
EPOCH=$2
REC=$3

TMP=`mktemp`

cat $REC | sed -e "s|EPOCH|$EPOCH|g" > $TMP

curl -H 'Authorization: Bearer foobar' -H 'Content-Type: application/json' -XPUT --data-binary "@$TMP" http://localhost:1210/app/stalling/profile/clarin.eu:cr1:p_1708423613607/record/$NR
