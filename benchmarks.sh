#!/bin/bash
# Performs benchmark tests

source ./settings.cfg

test_date=$1
page=$2
url=$3

echo "Load testing $url."

#drush $2 cc all

if [ ! -d $wpt_outputdir/$test_date/ab ]; then
  mkdir $wpt_outputdir/$test_date/ab
fi

ab -n 10 -c 1 -q -e $wpt_outputdir/$test_date/ab/$page-nn1000c10.csv $url > $wpt_outputdir/$test_date/ab/$page-n1000c10.txt

# TODO: Clear caches

#ab -n 10000 -c 10 -e test-data/$test_date/n10000c10.csv $psi_url

# TODO: Clear caches

#ab -n 10000 -c 50 -e $test_date/n10000c50.csv $psi_url

# TODO: Clear caches

#ab -n 50000 -c 50 -e $test_date/n50000c50.csv $psi_url

# TODO: Clear caches

#ab -n 50000 -c 100 -e $test_date/n50000c100.csv $psi_url
