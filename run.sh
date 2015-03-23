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

source ./url-keys.cfg

  for i in "${!urls[@]}"
  do

    #rebase?

    echo ${pages[$i]}

    ./benchmarks.sh $test_date ${pages[$i]} ${urls[$i]}

    #./psi.sh $test_date $i ${urls[$i]}

  done

else
  echo "Aborting"
  exit 1
fi

# the wpt tool reads urls from a file, so we don't loop over it.
#./wpt.sh $test_date

echo "Tests complete, results can be found in $wpt_outputdir/$test_date"
