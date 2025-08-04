#!/bin/sh

if [ -z "$1" ]
then
    echo "USAGE: $0 <new.json>"
    exit 1
fi

NEW=$1
EPOCH=`date +%s`
TMP=`mktemp`

cat $NEW | sed -e "s|EPOCH|$EPOCH|g" > $TMP

curl -H 'Authorization: Bearer foobar' -H 'Content-Type: application/json' -XPOST --data-binary "@$TMP" http://localhost:1210/app/stalling/profile/clarin.eu:cr1:p_1708423613607/record/
