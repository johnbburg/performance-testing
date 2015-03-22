#!/bin/bash
# Performs Google Page Speed analysis
# https://www.npmjs.com/package/psi

source ./settings.cfg

exists="$(which psi)"

test_date=$1

if [ -n $exists ]; then

 mkdir $wpt_outputdir/$test_date/psi

 echo "Running Page Speed Tests"

 psi $psi_url --format json --strategy desktop > $wpt_outputdir/$test_date/psi/desktop.json

 psi $psi_url --format json --strategy mobile > $wpt_outputdir/$test_date/psi/mobile.json

else
 echo "Page speed analysis not available. Install the psi plugin (https://www.npmjs.com/package/psi) and try again."
fi
