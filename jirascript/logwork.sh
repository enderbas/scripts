#!/bin/bash

username=$1
password=$2
issue=$3
host=$4
today=`date +%Y-%m-%d`"T09:00:00.000+0200"

data='{"comment":"","started":'"\""$today"\""',"timeSpentSeconds":28800}'

curl -u $username:$password \
-X POST https://$host.com/jira/rest/api/2/issue/$issue/worklog \
-H 'Content-Type: application/json' -d $data >> ~/worklog-log.txt
