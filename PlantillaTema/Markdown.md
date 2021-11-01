---
# Informació general del document
title: Introducció a Markdown
lang: ca

# Portada
titlepage: true
titlepage-rule-height: 2
titlepage-rule-color: 653097
#titlepage-background: img/portada.png

# Taula de continguts
toc-own-page: true
toc-title: Continguts

# Capçaleres i peus
header-left: Introducció a Markdown
header-right: Curs 2021-2022
footer-left: IES Jaume II el Just - PSP
footer-right: \thepage/\pageref{LastPage}

# Llistats de codi 
listings-no-page-break: true
listings-disable-line-numbers: true

# Per obtindre el número de pàgines cal afegir este paquet
header-includes:
   - \usepackage{lastpage}
---

# El llenguatge Markdown

![](img/md.jpg){ width=5cm }

Markdown es defineix com un **llenguatge de marques lleuger**, amb la finalitat d'escriure utilitzant un format de text pla, fàcil d'escriure i de llegir, i que puga convertir-se a altres formats, com HTML, epub o pdf.

A la web [https://markdown.es/](https://markdown.es/) disposeu de molta informació i un vídeo bastant bo sobre aquest llenguatge i algunes eines que us faciliten la vida a l'hora de generar documents.

Amb Markdown podem formatar el text amb lletres cursives, negretes, capçaleres o enllaços utilitzant únicament text pla, el que fa que l'escriptura siga més simple i eficient, ja que ens evita haver d'estar pensant en el format i ens permet centrar-nos només en el contingut. La seua facilitat d'us i sintaxi clara, junt amb que permet incloure i formatar codi font, fa que siga le llenguatge per excel·lència en llocs com Gihtub per tal de documentar els projectes que allotja.

Segon John Gruber, el seu creador en 2004:

>
> Un document amb format Markdown hauria de ser > publicable tal qual, com a text pla, sense que semble que > s’ha marcat amb etiquetes o instruccions de format. 
>

## Variants

La versió original de Gruber podríem dir que és el format estàndard. Aporta format de text (negretes i cursives), així com marques de continguts (títols, imatges, enllaços, cites, línies horitzontals o blocs de codi), llistes ordenades i desordenades, etc.

A més, han anat apareixent diverses variants com puguen ser:

* **CommonMark**: Centrat en la conversió a HTML.
* **Github Flavored Markdown**: Markdown aplicat a Github, afig sintaxi relacionada com el contingut relatiu al control de versions, revisions, etc.
* **Multimarkdown**, afig altres funcionalitats i continguts,
* **Pandoc Markdown**: Basat en l'estàndard, però amb extensions pot afegir marques d'altres sabors. 

## Sintaxi de markdown

Veiem un ressum d'allò més important respecta a la sintaxi:

### Paràgrafs

    * Per definir paràgrafs, calen dos salts de línia.
    * Amb un salt de línia, s'entén que és el mateix paràgraf.
    * Si volem incloure un salt de línia a meitat del paràgraf, afegirem al menys dos espais al final de la línia.

    ```markdown
    Paràgraf 1

    Paràgraf 2, amb espais al final...  
    per forçar un salt de línia.
    ```    

### Capçaleres

Hi ha diverses formes de marcar capçaleres:

```
Amb el signe d'igual
====================

Amb el guió
-----------
```

* **Estil ATX**: Utilitzem el símbol `#` per indicar el nivell de la capçalera. S'admeten fins a sis nivells de profunditat (`######`), el que vindria a ser del `h1` fins al `h6` d'HTML.

```markdown

# Capçalera de primer nivell

## Capçalera de segon nivell nivell

### Capçalera de tercer nivell nivell

...

```

Disposeu de més informació sobre les capçaaleres a la [secció de Markdown manual del manual de Pandoc](https://pandoc.org/MANUAL.html#headings).

### Formatació de text

```markdown
*Text en cursiva* (compte amb no posar espais darrere el primer * d'inici o davant el * del final)
**Text en negreta** (compte també amb els espais)
***Text en cursiva i negreta***
```

### Llistes

```markdown
* Item 1 en llista desordenada
* Item 2 en llista desordenada
* ...
```

```markdown
1. Item 1 en llista ordenada
2. Item 2 en llista ordenada
* ...
```

### Taules

Les taules han de tindre una capçalera i un cos, i la seua sintaxi és la següent:

```markdown
| Camp 1 capçalera | Camp 2 capçalera |
|------------------|------------------|
| Valor            | Valor            |
| Altre valor | Altre valor |
```

Cal tindre en compte que podem afegir tants camps com volguem. A més, la línia que separa la capçalera del cos `|---|---|` és obligatòria, però no és necessari que tinga tants caràcters com tinguen les capçaleres.

### Fragments de codi

Els fragments de codi els podem posar bé de forma `inline`, escrivint en la mateixa línia el codi que volem escriure tantat entre `'accents oberts'`, o bé si es tracta d'un fragment de codi, podem fer:

```
'''
línia 1
línia 2
etc
'''
```

A més, darrere de les cometes podem indicar el llenguatge que es tracta (java, python, markdown, cs, js, etc.), de manera que tinga en compte la sintaxi del llenguatge quan el *pinte*.

### Cites

Per afegit una cita, fem ús del símbol major que `>`. A més de cites, ens poden servir per afegir notes al text, aclaracions, etc. 

Recordeu que una cita, si conté paràgrafs, caldrà indicar el dos salts que línia, que en aquest cas, sería una línia sola amb el `>`. A més, dins d'ella, podem afegir qualsevol marca de format:


Per exemple:

```markdown

> ## Títol de la nota
>
> Paràgraf 1
>
> Paràgraf 2.
>

```

genera:


> ## Títol de la nota
>
> Paràgraf 1
>
> Paràgraf 2.
>


### Enllaços

El format per afegir un enllaç és el següent:

```
[Text de l'enllaç](URL_o_adreça_relativa)
```

Per exemple:

```
[Fitxer README general](./../README.md)]
```

Genera:

[Fitxer README general](./../README.md)

### Imatges

La sintaxi per afegir una imatge és semblant a la de l'enllaç, predecida d'una exclamació `!`:

```
![Exemple d'imatge](./../img/anell.png)
```

A més, podem indicar la grandària entre els símbols `{}` al final:

```
![Exemple d'imatge](./../img/anell.png){ width=300px }
```

```
![Exemple d'imatge](./../img/anell.png){ width=5cm }
```

Aquesta grandària de les imatges és respectada per Pandoc, però a Github, per exemple o altres conversions com HTML amb Hugo, no es respecta.

## Informnació addicional

Per a més informació sobre Markdown podeu consultar:

* La guía de markdown en espanyol: [https://markdown.es/](https://markdown.es/) 
* La sintaxi estesa de markdown a la web: [https://www.markdownguide.org/extended-syntax](https://www.markdownguide.org/extended-syntax)
* La secció dedicada a Markdown al [Manual de Pandoc](https://pandoc.org/MANUAL.html#pandocs-markdown)


## Edició de fitxers Markdown

Markdown es un format de text, pel que qualsevol editor de text ens és suficient.

No obstant això, existeixen eines tipus Haroopad o editors Markdown online que proporcionen una finestra partida on podem escriure en format Markdown a una part, i veure'n el resultat en directe al costat.

L'editor VSCode també suporta directament el llenguatge Markdown i ofereix un previsualització del que anem fent. No obstant això, existeixen extensions com *Markdwon All In One* que aporta altres funcionalitats com tecles d'accés ràpid, suport a taules de continguts, entre d'altres. (Consulteu el [document sobre VSCode per a més informació](../VSCode/VSCode.md))