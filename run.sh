#!/bin/bash
# Site performance test automater


if [ ! -f settings.cfg ]; then
  echo "Please create a settings.cfg file first."
  exit 1;
fi

if [ ! -f url-keys.cfg ]; then
  echo "Create a url-keys.cfg file"
  exit 1;
fi

source ./settings.cfg
source ./url-keys.cfg

test_date=$(date +%F-%H-%M)

while getopts 'apw' flag; do
  case "${flag}" in
    a) benchmark='true' ;;
    p) pagespeed='true' ;;
    w) webpagetest='true' ;;
    *) echo "usage ./run.sh [-a] [-p] [-w]"
    exit 1;
  esac
done


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



  for i in "${!urls[@]}"
  do

    #rebase?

    if [ "$benchmark" = 'true' ]; then
      ./benchmarks.sh $test_date ${pages[$i]} ${urls[$i]}
    fi

    if [ "$pagespeed" = 'true' ]; then
      ./psi.sh $test_date ${pages[$i]} ${urls[$i]}
    fi

  done

else
  echo "Aborting"
  exit 1
fi

# the wpt tool reads urls from a file, so we don't loop over it.

if [ "$webpagetest" = 'true' ]; then
  ./wpt.sh $test_date
fi

echo "Tests complete, results can be found in $wpt_outputdir/$test_date"
