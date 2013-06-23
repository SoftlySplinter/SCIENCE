#! /bin/sh

TEMP=./.temp

touch $TEMP

for i in $1/*.md
do
    cat $i >> $TEMP
    echo "\n" >> $TEMP
done
pandoc --smart --standalone --table-of-contents --mathml --from=markdown --to=html --output=$2.html $TEMP


rm $TEMP
