#! /bin/sh
if test $# -eq 0
then
  echo "You bastard"
  exit 255
fi

FILE=".notes"
EXT_FILE="aber-level-m.txt"
BASE="https://gingkoapp.com/"
URL="${BASE}${EXT_FILE}"
TEMP=".temp"

wget --quiet --output-document=${FILE} -- ${URL}

if grep --silent "^# ${1}" $FILE
then
  LINESTART=`grep --line-number "^# ${1}" $FILE | awk --field-separator=: '{print $1}'`
  START=`expr $LINESTART + 1`
  sed -n "${START},\$p" $FILE > $TEMP
  LINEEND=`grep --max-count 1 --line-number "^# .*" $TEMP | awk --field-separator=: '{print $1}'`
  rm ${TEMP}
  if [ -z "$LINEEND" ]
  then
    LINEEND="$"
  else
    LINEEND=`expr $LINEEND + $LINESTART - 1`
  fi
  sed -n "${LINESTART},${LINEEND}p" $FILE > md/${1}/00-notes.md
else
  echo "Module ${1} not found."
  exit 254
fi

rm ${FILE}

#git add .
#git commit -m "[auto] Add notes from `date`"
#git push
