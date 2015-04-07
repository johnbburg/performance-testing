#!/bin/bash
# Performs benchmark tests

source ./settings.cfg

test_date=$1
i=$2
url=$3

echo "Load testing $url."

#drush $2 cc all

if [ ! -d $wpt_outputdir/$test_date/ab ]; then
  mkdir $wpt_outputdir/$test_date/ab
fi

ab -n 100 -c 10 -q -e $wpt_outputdir/$test_date/ab/$i-n100c10.csv $url > $wpt_outputdir/$test_date/ab/$i-n100c10.txt

ab -n 10000 -c 10 -e $wpt_outputdir/$test_date/ab/$i-n10000c10.csv $url > $wpt_outputdir/$test_date/ab/$i-n10000c10.txt

ab -n 10000 -c 50 -e $wpt_outputdir/$test_date/ab/$i-n10000c50.csv $url > $wpt_outputdir/$test_date/ab/$i-n10000c50.txt

ab -n 10000 -c 100 -e $wpt_outputdir/$test_date/ab/$i-n10000c100.csv $url > $wpt_outputdir/$test_date/ab/$i-n10000c100.txt

ab -n 10000 -c 200 -e $wpt_outputdir/$test_date/ab/$i-n10000c200.csv $url > $wpt_outputdir/$test_date/ab/$i-n10000c200.txt
