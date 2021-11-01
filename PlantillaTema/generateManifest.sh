#!/usr/bin/env bash
# shellcheck disable=SC2154
# shellcheck disable=SC1091

# Configure
#set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
source yaml.sh

create_variables content.yml


# Mostra la secció de títols dels recursos
print_titles(){
    echo -e "\t\t\t<title>$title</title>";
    let len=${#items__title[@]}-1  || 0

    for i in $(seq 0 ${len});do
        #echo "item ${i}: ${items__title[${i}]} -> ${items__file[${i}]}";
        echo -e "\t\t\t<item identifier=\"item_${i}\" identifierref=\"resource_${i}\">"
        echo -e "\t\t\t\t<title>${items__title[${i}]}</title>";
        echo -e "\t\t\t</item>"
    done
}

print_resources(){
echo "<resources>";
for i in $(seq 0 ${len});do
    #echo "item ${i}: ${items__title[${i}]} -> ${items__file[${i}]}";
    echo -e "\t\t<resource identifier=\"resource_${i}\" type=\"webcontent\" adlcp:scormtype=\"sco\" href=\"content/${items__file[${i}]}\" />"
done
echo "</resources>";
}

echo -e '<?xml version="1.0" standalone="no" ?>\n';
echo "<manifest identifier=\"${id}\" version=\"1\"
         xmlns=\"http://www.imsproject.org/xsd/imscp_rootv1p1p2\"
         xmlns:adlcp=\"http://www.adlnet.org/xsd/adlcp_rootv1p2\"
         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
         xsi:schemaLocation=\"http://www.imsproject.org/xsd/imscp_rootv1p1p2 imscp_rootv1p1p2.xsd
                             http://www.imsglobal.org/xsd/imsmd_rootv1p2p1 imsmd_rootv1p2p1.xsd
                             http://www.adlnet.org/xsd/adlcp_rootv1p2 adlcp_rootv1p2.xsd\">";

echo "
    <metadata>
        <schema>ADL SCORM</schema>
        <schemaversion>1.2</schemaversion>
    </metadata>";

ORG=${id//./_}
echo "
    <organizations default=\"${ORG}\">
		<organization identifier=\"${ORG}\">";

print_titles
echo "
        </organization>
    </organizations>";

print_resources
echo "</manifest>";
