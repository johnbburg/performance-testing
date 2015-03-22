#!/bin/bash
# Site performance test automater


source ./settings.cfg

test_date=$(date +%F-%H-%M)

read -p "This will run several benchmark tests against the identified server. Do you wish to proceed? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

  if [ ! -d $wpt_outputdir ]; then
    mkdir $wpt_outputdir
  fi

  if [ -d $wpt_outputdir ]; then
    mkdir $wpt_outputdir/$test_date
  else
    echo "Failed to create data directory."
    exit 1;
  fi

  #./benchmarks.sh $test_date

  #./wpt.sh $test_date

  ./psi.sh $test_date

fi

