# Introducció a Pandoc

El programari Pandoc està format per un conjunt de programes que inclou una llibrería de funcionalitats, que realitzen la conversió entre fitxers de text amb diferents formats de marcat, junt amb una eina de la línia d'ordres que fa ús d'aquesdta llibrería.

Entre els formats que és capaç de treballar Pandoc es troben Markdown, HTML, LaTeX, OpenDocument (Libreoffice), docx (Ms Word) o pdf.

Pandoc suporta una versió millorada de Markdown, que inclou sintaxi específica per a taules, llistes de definicions, blocs de dades, notes a peu de pàgina, cites o fòrmules matemàtiques entre d'altres.

El disseny de Pandoc és modular, i consisteix en un conjunt de lectors o *readers* i escriptors o *writers*.  Els lectors analitzen el text en un format i el reprodueixen internament, en una estructura jeràrquica (en forma d'arbre de sintaxi, anomentat també resum o AST). Per la seua banda, els escriptors converteixen aquesta representació jeràrquica en el format al que es vol convertir. D'aquesta manear, per tal de suportar un nou format d'entrada o eixida, només cal desenvolupar el lector o escriptor corresponent.

Existeixen formats d'entrada o eixida que són menys expressius que la representació interna que fa Pandoc, pel que no hem d'esperar conversions perfectes entre tots els formats (taules complexes, mides dels marges...). La millor manera d'assegurar una eixida el més perfecta possible, és fent ús del propi Markdown de pandoc.

# Instal·lació

Els repositoris d'Ubuntu contenen el paquet `pandoc`, que podem instal·lar directament des de l'eina `apt` o el gestor de paquets del sistema.

Ubuntu 20.04 (i per tant LliureX 21 i Justix 20.04) disposen d'un empaquetat propi de la versió 2.5 de Pandoc, que és de novembre de 2018. Si volem accedir a la última versió, la podrem descarregar a través de l'enllaç https://github.com/jgm/pandoc/releases/latest. En estos moments (setembre 2021), la última versió disponible és la 2.14.2.

Per tal de descarregar esta última versió, només haurem de descarregar el paquet corresponent al nostre sistema operatiu. Al nostre cas, per a Debian/Ubuntu/Lliurex de 64 bits descarregarem `pandoc-2.14.2-1-amd64.deb`.

Una vegada descarregat, tenim diverses opcions d'instal·lar-lo:

1. Fent doble clic en ell per tal que se'ns òbriga el gestor de programari del sistema (Discover, EPI, Ubuntu Software Center )

pandocDiscover.png

2. Fet ús de l'eina dpkg, des de la línia d'ordres, com a administradors:

```
$ sudo dpkg -i pandoc-2.14.2-1-amd64.deb
```

2. Fet ús de les eines d'instal·lació des de la línia d'ordres, com per exemple apt (tingueu en compte  que caldrà iindicar la ruta cap al fitxer .deb que hajau descarregat):

```
$ sudo apt install ./pandoc-2.14.2-1-amd64.deb
```

# Ús de Pandoc

Per tal d'utilitzar Pandoc, farem ús de l'eina de la línia d'ordres `pandoc`, instal·lada amb el paquet pandoc.

Tot i que l'ordre permet agafar l'entrada des del teclat i mostrar l'eixida per pantalla, la forma més habitual d'utilitzar-lo serà indicant un fitxer d'entrada i l'eixida, amb el paràmetre `-o`:

```bash
$ pandoc fitxerEntrada -o fitxerEixida
```

Aquesta ordre llig el fitxer `fitxerEntrada` i crea el fitxer `fitxerEixida`. Fixeu-vos que aquests noms de fitxers, com a tal, no tenen extensió. Si utilitzem directament aquesta ordre (i el fitxer `fitxerEntrada` existeix), obtindrme l'eixida:

```
[WARNING] Could not deduce format from file extension
  Defaulting to markdown
[WARNING] Could not deduce format from file extension
  Defaulting to html

```
Que ens indica que no pot deduir el format del fitxer a partir de l'extensió. El que fa en aquest cas és donar per sentat que el format del fitxer d'entrada serà *markdown* i el d'eixida *html*.

Per tal d'evitar estes advertències, caldrà que els fitxers tinguen una extensió. Així, per exemple, sería més convenient fer:

```
pandoc fitxerEntrada.md -o fitxerEixida.html
```
Per defecte, pandoc produeix un fragment de document, no un document complet. Per tal de generar un fitxer HTML complet, amb el `<head>` i `<body>` caldrà utilitzar l'opció `-s`o `--standalone`:

```
$ pandoc fitxerEntrada.md -o fitxerEixida.html -s

[WARNING] This document format requires a nonempty <title> element.
  Defaulting to 'fitxerEntrada' as the title.
  To specify a title, use 'title' in metadata or --metadata title="...".

```

Amb això generarem l'HTML complet. L'advertència que ens apareix, es deu a que el document d'eixida necessita un títol. Això ho resolem incloent el camp `title` al bloc de metadades del fitxer, o des de la pròpia ordre, afagint, com s'indica `metadata title="títol de la pàgina"` en la línia d'ordres:

```
pandoc fitxerEntrada.md -o fitxerEixida.html -s --metadata title="Pàgina de prova"
```

### Concatenació de diversos fitxers

Pandoc permet especificar diferents fitxers d'entrada, de manera que els concatene en línies en blanc entre ells abans de fer l'anàlisi. Si volem que s'analitzen individualment, haurem de d'afegir el flag --file-scope.

## Especificació de formats

Hem vist que Pandoc dedueix el format del fitxer a partir de l'extensió, però el format d'entrada també es pot especificar amb l'opció -f (from) i el d'eixida amb -t (to).

Per exemple, per fer la conversió anterior, faríem:

```
pandoc fitxerEntrada -o fitxerEixida -f markdown -t html
```

Per consultar els possibles formats d'entrada i d'eixida utilitzarem els flags --list-input-formats i --list-output-format.

```
pandoc --list-input-formats

pandoc --list-output-formats
```


# Creació d'eixides en PDF

La generació de fitxers pdf es realitza exactament igual que qualsevol altre tipus de fitxer, bé indicant l'extensió .pdf en el fitxer d'eixida, com indicant el paràmetre -t pdf:

```
pandoc fitxerEntrada.md -o fitxerEixida.pdf

pandoc fitxerEntrada.md -o fitxerEixida -t pdf
```

Ara bé, si llancem qualsevol de les dues ordres anteriors, obtindrem el següent missatge d'error:

```
pdflatex not found. Please select a different --pdf-engine or install pdflatex
```

Açò es deu a que Pandoc utilitza, de forma predeterminada, LaTeX per crear el PDF, i per tant, necessitem d'un motor LaTeX instal·lat al sistema.

A més de LaTeX, Pandoc pot generar documents pdf utilitzant altres motors, com per exemple ConTeXt, roff ms o HTML, que també caldría instal·lar. Per tal d'indicar el motor de generació de PDF utilitzarem les opcions `-t format` o bé `--pdf-engine motor_pdf`.

Per exemple:

```
pandoc fitxerEntrada -o fitxerEixida.pdf  -f markdown -t html
```

Encara que açò també ens donaria l'error perquè necessitem el motor de pdf corresponent a HTML. Aquests motors estan disponibles generalment en els fonts de qualsevol distribució linux.

Veiem a les següents taules les possibilitats que tenim per tal de generar documents PDF bé amb l'opció `-t` o bé amb `--pdf-engine`:


| Motor de PDF | Opció per a Pandoc         | Paquet             |
|--------------|----------------------------|--------------------|
| LaTeX        | (per defecte) o `-t latex` | texlive-latex-base |
| HTML         |  `-t html`                 | wkhtmltopdf        |
| ConTeXt      |  `-t context`              | context            |
| Roff ms      |  `-t ms`                   | groff            |


A més, fent ús de l'opcó `--pdf-engine`, podem triar entre:

| Motor de PDF | Opció per a Pandoc         | Paquet             |
|--------------|----------------------------|--------------------|
| HTML         | `--pdf-engine wkhtmltopdf` | wkhtmltopdf        |
| Weasyprint   | `--pdf-engine weasyprint`  | weasyprint         |
| Prince       | `--pdf-engine prince`      | prince (des de [la seua web](https://www.princexml.com/download/)) |
| LaTeX |      | `--pdf-engine pdflatex`    | texlive-latex-base           |
| LuaLaTeX     | `--pdf-engine lualatex`    | texlive-latex-base           |
| XeLaTeX      | `--pdf-engine xelatex`     | texlive-xetex      |
| LaTeXmk      | `--pdf-engine latexmk`     | latexmk            |
| Tectonic     | `--pdf-engine tectonic`    | tectonic (des dels [repositoris de Github](https://github.com/tectonic-typesetting/tectonic/releases))          |
| Roff ms      | `--pdf-engine pdfroff`     | groff            |
| ConTeXt      | `--pdf-engine context`     | context            |


Així, per instal·lar el motor per defecte, farem:

```
sudo apt install pdflatex
```

O si volem el motor xelatex que utilitzarem a la plantilla:

```
sudo apt install texlive-xetex
```

Amb açò, si *xelatex* és l'únic motor pdf instal·lat, no caldrà indicar res més, però si tenim diversos motors, caldrà indicar que volem utilitzar aquest amb `--pdf-engine`:

```
pandoc fitxerEntrada -o fitxerEixida.pdf  --pdf-engine xelatex
```

### Package babel error

Si no tenim cap idioma instal·lat, és possible que obtinguem un error en la conversió d'aquest tipus:

```
Error producing PDF.
! Package babel Error: Unknown option `catalan'. Either you misspelled it
(babel)                or the language definition file catalan.ldf was not found.
```

Per resoldre-ho, podem intal·lar el paquet `texlive-lang-spanish`, o `texlive-lang-all`.

## Treballant amb plantilles

Pandoc permet treballar amb plantilles per a diversos tipus de documents (pdf, odt), que defineixen l'aspecte dels nostres documents.

Si genereu un document pdf, per defecte utilitza la plantilla *estàndard* d'aquest tipus de documents amb Latex. No obstant això, podem indicar una altra plantilla amb l'opció --template:

```
pandoc fitxerEntrada -o fitxerEixida.pdf  --pdf-engine xelatex --template=nomPlantilla.latex
```

Disposeu de més informació sobre creació de plantilles a la [documentació de Pandoc](https://pandoc.org/MANUAL.html#templates).

Al nostre cas, fem ús de la [plantilla Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template). 

## Manual

Tot el que s'ha comentat és un ressum de la introducció del [Manual de Pandoc](https://pandoc.org/MANUAL.htm), que podeu consultar per obtindre molta més informació al respecte.