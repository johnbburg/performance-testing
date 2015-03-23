#!/bin/bash
# Performs web page test

source ./settings.cfg
test_date=$1

echo $wpt_urlfile

if [ -f $wpt_urlfile ]; then
  echo "Running Web Page Tests on all urls in $wpt_urlfile"
  ./webpagetest/wpt_batch.py -k $wpt_api_key -s $wpt_server -o $wpt_location -i $wpt_urlfile -f $wpt_outputdir/$test_date/wpt -r 2
else
  echo "Missing wpt url file. Web Page Test will not run."
fi