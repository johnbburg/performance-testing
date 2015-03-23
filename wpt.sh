#!/bin/bash
# Performs web page test

source ./settings.cfg
test_date=$1

echo "Running Web Page Tests on all urls in $wpt_urlfile"

./webpagetest/wpt_batch.py -k $wpt_api_key -s $wpt_server -o $wpt_location -i $wpt_urlfile -f $wpt_outputdir/$test_date/wpt -r 2