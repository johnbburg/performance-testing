#!/bin/bash
# Performs web page test

source ./settings.cfg
test_date=$1

echo $wpt_urlfile

if [ -f $wpt_urlfile ]; then
  echo "Running Web Page Tests on all urls in $wpt_urlfile"
  echo "./webpagetest/wpt_batch.py -k $wpt_api_key -s $wpt_server -o Dulles:Chrome -y Cable -i $wpt_urlfile -f $wpt_outputdir/$test_date/wpt -r 2 -a 1"
  ./webpagetest/wpt_batch.py -k $wpt_api_key -s $wpt_server -o Dulles:Chrome -y Cable -i $wpt_urlfile -f $wpt_outputdir/$test_date/wpt/ -r 2 -a 1

  echo "./webpagetest/wpt_batch.py -k $wpt_api_key -s $wpt_server -o \"Dulles_IE11\" -y \"Cable\" -i $wpt_urlfile -f $wpt_outputdir/$test_date/wpt -r 2 -a 1"
  ./webpagetest/wpt_batch.py -k $wpt_api_key -s $wpt_server -o "Dulles IE11" -y "Cable" -i $wpt_urlfile -f $wpt_outputdir/$test_date/wpt -r 2 =a 1

  echo "./webpagetest/wpt_batch.py -k $wpt_api_key -s $wpt_server -o \"Dulles:iOS\" -y \"3G\" -i $wpt_urlfile -f $wpt_outputdir/$test_date/wpt -r 2 -a 1"
  ./webpagetest/wpt_batch.py -k $wpt_api_key -s $wpt_server -o "Dulles:iOS" -y "3G" -i $wpt_urlfile -f $wpt_outputdir/$test_date/wpt -r 2 -a 1

else
  echo "Missing wpt url file. Web Page Test will not run."
fi