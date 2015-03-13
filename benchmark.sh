#!/bin/bash
# Site performance test automater

if [ $# -eq 0 ]
then
  echo "Usage: benchmark <url> <@alias>"
  exit 1
fi


test_date=$(date +%F-%H-%M)

read -p "This will run several benchmark tests against the identified server. Do you wish to proceed? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

  mkdir $test_date

  #drush $2 cc all

  ab -n 100 -c 10 -e test-data/$test_date/n1000c10.csv $1

  #drush $2 cc all

  ab -n 10000 -c 10 -e test-data/$test_date/n10000c10.csv $1

  #drush $2 cc all

  #ab -n 10000 -c 50 -e $test_date/n10000c50.csv $1

  #ab -n 50000 -c 50 -e $test_date/n50000c50.csv $1

  #ab -n 50000 -c 100 -e $test_date/n50000c100.csv $1

fi

