#!/bin/bash
# Performs benchmark tests

echo "Running load tests. This could take a while."

source ./settings.cfg

test_date=$1

#drush $2 cc all

mkdir $wpt_outputdir/$test_date/ab

ab -n 100 -c 10 -e $wpt_outputdir/$test_date/ab/n1000c10.csv $psi_url > $wpt_outputdir/$test_date/ab/n1000c10.txt

#drush $2 cc all

#ab -n 10000 -c 10 -e test-data/$test_date/n10000c10.csv $psi_url

#drush $2 cc all

#ab -n 10000 -c 50 -e $test_date/n10000c50.csv $psi_url

#ab -n 50000 -c 50 -e $test_date/n50000c50.csv $psi_url

#ab -n 50000 -c 100 -e $test_date/n50000c100.csv $psi_url
