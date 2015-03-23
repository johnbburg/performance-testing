#!/bin/bash
# Performs Google Page Speed analysis
# https://www.npmjs.com/package/psi

source ./settings.cfg

test_date=$1
page=$2
url=$3

if hash psi 2>/dev/null; then

 if [ ! -d $wpt_outputdir/$test_date/psi ]; then
   mkdir $wpt_outputdir/$test_date/psi
 fi

 echo "Running Google PageSpeed Insights on $url"

 psi $url --format json --strategy desktop > $wpt_outputdir/$test_date/psi/$page-desktop.json

 psi $url --format json --strategy mobile > $wpt_outputdir/$test_date/psi/$page-mobile.json

 exit 0;

else
 echo "PageSpeed plugin not available. Install the psi plugin (https://www.npmjs.com/package/psi) and try again."
 exit 1;
fi
