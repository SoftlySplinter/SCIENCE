#! /bin/sh

URL="https://gingkoapp.com"
DEFAULT_TREE="aber-level-m"
FILE=".notes"
TEMP=".temp"
DIR="modules"
added=""

usage() {
  echo "Usage: ${0} -m <module>|-a [-t <tree name>] -p" 1>&2
  exit 1
}

getmodule() {
  module=$1
  out=${DIR}/${module}.md
  if [ $module = "Seminars" ]
  then
    return 2
  fi
  start=$(grep --line-number "^# ${module}" $FILE | awk --field-separator=: '{print $1}')
  linestart=$(expr ${start} + 1)
  sed -n "${linestart},\$p" $FILE > $TEMP
  lineend=$(grep --max-count 1 --line-number "^# .*" $TEMP | awk --field-separator=: '{print $1}')
  if [ -z ${lineend} ]
  then
    end="$"
  else
    end=$(expr $lineend + $start - 1)
  fi
  sed -n "${start},${end}p" ${FILE} > ${out}
  added="${added} ${out}"
}

while getopts "m:at:p" flag
do
  case $flag in
    m)
      if [ ! -z $all ]
      then
        usage
      fi
      module=$OPTARG
      ;;
    a)
      if [ ! -z $module ]
      then
        usage
      fi
      all=1
      ;;
    t)
      tree=$OPTARG
      ;;
    p)
      git=1
      ;;
    *)
      usage
      ;;
  esac
done

if [ -z ${all} ] && [ -z ${module} ]
then
  usage
fi

url="${URL}/${tree:-${DEFAULT_TREE}}.txt"

trap 'rm -f ${FILE} ${TEMP}' INT TERM EXIT
wget --quiet --no-check-certificate --output-document=${FILE} -- ${url}

if [ ! -z $all ]
then
  IFS_BAK=$IFS
  IFS="
"
  for i in `grep "^# " $FILE`
  do
    module=`echo $i | awk --field-separator=' ' '{print $2}'`
    getmodule $module
  done
  IFS=$IFS_BAK
fi

if [ ! -z $module ]
then
  getmodule $module
fi

if [ ! -z $git ]
then
  git add ${added}
  git commit -m "[auto] Add notes from $(date)"
  git push
fi
