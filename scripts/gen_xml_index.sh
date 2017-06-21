#!/bin/bash


OUTPUT_FILE=res/index.xml

cd res

XML_FILES=$(find Notenrollen -name '*.xml')

cd ..

> $OUTPUT_FILE

echo '<?xml-stylesheet type="text/xsl"?>' >> $OUTPUT_FILE
echo '<list>' >> $OUTPUT_FILE
for f in $XML_FILES; do
  echo "<entry name =\"$f\"/>" >> $OUTPUT_FILE
done
echo '</list>' >> $OUTPUT_FILE
