#!/bin/bash

[ -d ./pdf ] || mkdir pdf

for FILENAME in `ls *.md`; do
	BASENAME="${FILENAME%.*}"
	TEMPLATE="templates/topdf.md";

	echo "Executing..."
	echo "pandoc $FILENAME --defaults ${TEMPLATE} -o ${BASENAME}.pdf"
	pandoc $FILENAME --defaults ${TEMPLATE} -o pdf/${BASENAME}.pdf
done

echo "DONE."
exit 0
