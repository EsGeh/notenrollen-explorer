#!/bin/bash

OUTPUT_FILE=res/all_objects.xml

XML_FILES=$(find res/Notenrollen/lido -name '*.xml')

> $OUTPUT_FILE

echo '<?xml version="1.0"?>' >> $OUTPUT_FILE

echo '<lido:lidoWrap xmlns:lido="http://www.lido-schema.org" xmlns="http://www.openarchives.org/OAI/2.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.lido-schema.org http://www.lido-schema.org/schema/v1.0/lido-v1.0.xsd">' >> $OUTPUT_FILE
for f in $XML_FILES; do
	cat "$f" | xmllint --format - | head -n -1 | tail -n +3 >> $OUTPUT_FILE
done
echo '</lido:lidoWrap>' >> $OUTPUT_FILE
