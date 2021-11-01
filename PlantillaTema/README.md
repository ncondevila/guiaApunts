---
title: PlantillaTema
---

# Plantilla d'Unitat

En aquest directori trobareu una plantilla amb diferents scripts per a la generació dels vostre materials de Markdown, tant a PDF com a web i format de curs SCORM.

La idea seria generar els fitxers en format Markdown en la mateix carpeta arrel de la plantilla, i utilitzar els diferents scripts per generar diferents eixides, sense necessitat d'instal·la el paquet mdfactory de la Justix.

>
> Actualització: Disposeu també dels scripts modificats per no haver de copiar tota la carpeta cada vegada. Mireu l'[últim apartat per vore com fer-ho](#installació-en-local-i-scripts-actualitzats).
>

## Contingut base de la carpeta

* **Carpeta portades**: Conté diferents portades genèriques en svg, que podeu editar i adaptar per fer les vostres. Si en teniu ja generades i les voleu compartir, podeu afegir-les aci també.
* **templates**:  Conté diferents plantilles per a la generació dels diferents tipus de documents:
  * Carpeta **scorm**: Conté els diferents xsd per als paquets SCORM. El fitxer imsmanifest.xml que descriu l'scorm es genera automàticament segons el fitxer `content.yml`, que vorem després.
  * Carpeta **webAssets**: Els css i javascript per a quan convertim a HTML (i per tant a Scorm).
  * Fitxer `eisvogel.latex`: La plantilla Eisvogel per a la conversió a pdfs, lleugerament modificada, que evita alguns errors amb determinats símbols al codi.
  * Fitxers `topdf.md` i `toweb.md`: Fitxers amb la configuració de l'eixida per als scripts de generació de PDFs i Web, respectivament. Contenen les opcions que passem directament a Pandoc.
  * Fitxer `webtemplate.html`: Plantilla per a la generació dels HTML.
* **Fitxer `content.yml`**: Fitxer en format YAML que descriu l'estructura del curs per als SCORM. Es comenta més avall.
* **Scripts `createPDF.sh`, `createPDFAll.sh`, i `createSCORM.sh`**: Per generar un únic PDF d'un fitxer markdown, una carpeta amb els pdfs de tots els markdowns de la carpeta, i un curs SCORM amb els markdowns i l'estructura definida al `content.yml`.
* **Altres Scripts: `generateManifest.sh` i `yaml.sh`**. Scripts auxiliars que utilitza l'script per generar l'Scorm.


## Howto

En principi, crearem els fitxers Markdown en la carpeta arrel, i les imatges que utilitzem, dins la carpeta `img`, referenciant a elles dins el fitxer amb la ruta relativa. Amb això, els diferents scripts, ja sabran on trobar cada cosa i generaran automàticament els diferents documents:

* **Per generar un pdf a partir d'un md:**

```sh
$ ./createPDF.sh Markdown.md 
Executing...
pandoc Markdown.md --defaults templates/topdf.md -o Markdown.pdf
FET.
```

Aquest pdf es crearà en la mateixa carpeta.

* **Per generar els pdfs de tots el .md del directori actual:**

```
 ./createPDFall.sh 
Executing...
pandoc IntroPandoc.md --defaults templates/topdf.md -o IntroPandoc.pdf
Executing...
pandoc Markdown.md --defaults templates/topdf.md -o Markdown.pdf
Executing...
pandoc README.md --defaults templates/topdf.md -o README.pdf
Executing...
pandoc YAML.md --defaults templates/topdf.md -o YAML.pdf
DONE.
joamuran@neon:/srv/cvs/guiaApunts/PlantillaTema$ ^C
```

Aquests es guardaran a la carpeta pdf.


* **Per generar un curs SCORM a partir dels Markdowns**, utilitzarem l'script `createSCORM.sh`. Aquest script necessita el fitxer de configuració `content.yml`, que defineix l'estructura del curs, i que tindrà el següent format:

```yaml
--
id: com.ieseljust.depinf.cicle.modul.tema
title: Exemple per generar un curs SCORM

# A comment just to say: list of persons
items:
  - title: Markdown
    file: Markdown.html
  - title: Pandoc
    file: IntroPandoc.html
  - title: YAML
    file: YAML.html
```

On:

* El camp `id` és l'identificador del recurs.
* El camp `title` és el títol del recurs SCORM.
* `items` és una llista d'items, que contenen:
    * El títol de cada apartat
    * El fitxer html d'aquest.

L'script generarà automàticament els HTML amb pandoc, de manera interna, i el nom html d'aquests recursos serà el mateix que el fitxer amb extensió .md, però amb extensió .html.

Açò generarà una carpeta `unzippedSCORM`, amb el contingut del paquet descomprimit, per si voleu fer ús dels HTML, i per altra banda, el fitxer `cursScorm.zip`, que podeu pujar directament al Moodle com a paquet SCORM. 

>
> Recordeu que els fitxers .md que hi ha actualment a la carpeta són de prova, per mostra el funcionament, pel que haureu d'esborrar-los quan aneu a afegir els vostres continguts.
>


## Instal·lació en local i scripts actualitzats

Per no haver de copiar cada vegada la carpeta amb tots els fitxers que porta, podem fer el següent:

1. Copiar el contingut de la carpeta PlantillaTema a la carpeta .local/share del vostre HOME (`~/.local/share/PlantillaTema`).

2. Actualitzar el PATH per accedir a ella:

```
export PATH=$PATH:~/.local/share/PlantillaTema
```

Si voleu aquest canvi persistent, podeu afegir un script amb aquest codi al directori `/etc/profile.d/`.

3. Utilitzar els script modificats, que són els mateixos que en l'apartat anterior, però sense l'extensió `.sh`:

* `createPDF`
* `createPDFall`
* `createSCORM`: **COMPTE!** Aquest script, copia de manera temporal la carpeta `templates` al directori de treball on esteu, i després l'esborra, pel que eviteu tindre una carpeta amb aquest nom.
* `prepareSCORM`: Aquest script és nou, i intenta *generar* automàticament el fitxer `content.yml`, a partir dels fitxers *.md* del directori actual i els títols que heu especificat a la capçalera (utilitza l'ordre head per a això, de manera que el títol haurà d'estar pel principi al markdown). Si tot va bé, només haureu de revisar l'ordre dels apartats i que els tìols apareguen (Si teniu cada fitxer numerat per l'apartat, ja ho fa automàticament)
