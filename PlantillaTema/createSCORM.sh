#!/bin/bash

rm -r ./unzippedSCORM # Comentar per no esborrar contingut!

if [ -d ./unzippedSCORM ]; then
    echo "Ja existeix la carpeta unzippedSCORM. Esborreu-la abans de generar-la de nou.";
    exit -1;
fi

echo "Creant estructura de directoris..."

# Creating dirs
mkdir -p ./unzippedSCORM/content/css

# Copying images
cp -r img unzippedSCORM/content

# Copying CSS and Javasript
cp -r templates/webAssets/* ./unzippedSCORM/content/

# Copying scorm structure (TO-DO Generate)
cp -r templates/scorm/* ./unzippedSCORM/

echo "Convertint a HTML..."

for FILENAME in `ls *.md`; do
	BASENAME="${FILENAME%.*}"
	TEMPLATE="templates/toweb.md";

	echo "pandoc $FILENAME --defaults ${TEMPLATE} -o unzippedSCORM/content/${BASENAME}.html"
	pandoc $FILENAME --defaults ${TEMPLATE} -o unzippedSCORM/content/${BASENAME}.html
done

echo "generant fitxer Manifest..."

./generateManifest.sh > unzippedSCORM/imsmanifest.xml

echo "Compressing..."
cd unzippedSCORM
zip -r ../cursScorm.zip ./*

echo "FET."
exit 0
