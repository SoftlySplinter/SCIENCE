#! /bin/sh

DIR="modules"
meta=.meta.xml

usage() {
  echo "Usage: ${0} -m <module>" 1>&2
  exit 1
}

makebook() {
  module=$1
  in=${DIR}/${module}.md
  cat <<EOF > ${meta}
<dc:title>${module}</dc:title>
<dc:language>en-UK</dc:language>
<dc:creator opf:file-as="Brown, Alexander D" opf:role="aut">Alexander D Brown</dc:creator> 
<dc:publisher>http://alexanderdbrown.com</dc:publisher>
<dc:date opf:event="publication">$(date --rfc-3339=date)</dc:date>
<dc:rights>Creative Commons Attribution 4.0 International License</dc:rights>
EOF

  pandoc --smart --mathml --epub-metadata=${meta} --from=markdown --to=epub --output=${module}.epub ${in}
}

while getopts "m:" flag
do
  case $flag in
    m)
      if [ ! -z $all ]
      then
        usage
      fi
      module=$OPTARG
      ;;
    *)
      usage
      ;;
  esac
done

if [ -z ${module} ]
then
  usage
fi

makebook ${module}
