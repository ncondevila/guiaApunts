---
# Front matter
# Metainformació del document
title: Exportant a PDF.  
titlepage: true
subtitle: Opcions avançades.
author: 
- Ferran Cunyat
- Joan Gerard Camarena
- Jose Alfredo Murcia
lang: ca

# portada
titlepage-rule-height: 2
titlepage-rule-color: AA0000
titlepage-text-color: AA0000
titlepage-background: ../portades/U2.png

# configuració de l'índex
toc-own-page: true
toc-title: Continguts
toc-depth: 2

# capçalera i peu
header-left: \thetitle
header-right: Curs 2021-2022
footer-left: CEFIRE València
footer-right: \thepage/\pageref{LastPage}

# Les figures que apareguen on les definim i centrades
float-placement-figure: H
caption-justification: centering 

# No volem numerar les linies de codi
listings-disable-line-numbers: true

# Configuracions dels paquets de latex
header-includes:

  #  imatges i subfigures
  - \usepackage{graphicx}
  - \usepackage{subfigure}
  - \usepackage{lastpage}



  #  - \usepackage{adjustbox}
  # marca d'aigua
  #- \usepackage{draftwatermark}
 # - \SetWatermarkText{\includegraphics{./img/Markdown.png}}
  #- \SetWatermarkText{Per revisar}
  #- \SetWatermarkScale{.5}
  #- \SetWatermarkAngle{20}
   
  # caixes d'avisos 
  - \usepackage{awesomebox}

  # text en columnes
  - \usepackage{multicol}
  - \setlength{\columnseprule}{1pt}
  - \setlength{\columnsep}{1em}

  # pàgines apaïsades
  - \usepackage{pdflscape}
  
  # per a permetre pandoc dins de blocs Latex
  - \newcommand{\hideFromPandoc}[1]{#1}
  - \hideFromPandoc {
      \let\Begin\begin
      \let\End\end
    }
 
# definició de les caixes d'avis
pandoc-latex-environment:
  noteblock: [note]
  tipblock: [tip]
  warningblock: [warning]
  cautionblock: [caution]
  importantblock: [important]
...


# Introducció

En aquesta secció anem a veure algunes directives que ens poden resultar interessant per a la generació de PDF a partir dels nostres documents escrits amb markdown, combinades amb la plantilla `Eisvogel`. Es veuran certs aspectes de la configuració de les directives YAML que afecten a tot el document i passarem després a veure alguns aspectes que ens ajudaran a maquetar els nostres documents amb un acabat professional.

La ferramenta que utilitzarem per dur a terme conversions entre arxius en markdown i pdf és [pandoc](https://pandoc.org/). Abans de començar cal comentar que processar amb pandoc un document de markdown és molt simple, però pot ser també molt potent. El conjunt d'etiquetes de markdown és molt simple i reduït, ja que està pensat més en el contingut que en la presentació. Com que pel camí de processar un md fins al pdf realitza una conversió (transparent a l'usuari) pel format tex (\LaTeX), això ens permet afegir comandaments de \LaTeX dins del nostre document. Com a contrapartida, dins d'un bloc Latex no podem afegir marques markdown, a menys que fem alguna coseta, com es veurà. El mateix ocòrre si posem codi HTML dins del nostre markdown.

::: note
Partirem d'un arxiu de capçalera bàsic, on anirem afegint opcions. Al final del tema apareixerà un exemple complet de dit arxiu amb comnetaris indicant que fa cada cosa.
:::

# Configuracions globals del document. Capçalera YAML o *front matter*

Abans de començar a composar el document pròpiament dit, hem d'establir la configuració global del nostre document, ajustant-ho a la plantilla _eisvogel_ que comentem. Oferim ací una capçalera YAML, anomenada en l'argot *front matter*, explicant cadascuna de les seues ocpions.

```yaml
---
title: Generant arxius PDF
subtitle: Transformació des de Markdown
author: 
- Ferran
- Joan
- Jose
abstract: |
  PDF és el format estàndar de distribució de documents

  Com genera-los de manera professional
lang: ca
titlepage: true
titlepage-rule-height: 0
titlepage-rule-color: 65309
titlepage-background: img/portada.png
toc-own-page: true
toc-title: Continguts
header-left: UD 2. Passant a PDF
header-center: \thesection
header-right: Curs 2021-2022
footer-left: CEFIRE
footer-center: Markdown para la creación de recursos
footer-right: \thepage de \pageref{LastPage}
---
```


## Metainformació del document

Els camps `title`, `subtitle`, `author` i `abstract` indiquen, tal i com indica, el títol i subtítol, autors i resum del document. Aquesta informació s'inserta automàticament a la portada, menys el resum que s'inserirà a la primera fulla desprès de la taula de continguts. Aquesta informació podriem posar-la _ad-hoc_, però resulta més còmode d'aquesta manera, donat que podrem referenciar-la des de tot el document mitjançant etiquetes Latex, com poden ser `\thetitle` o `\theauthor`.

## Opcions de la pàgina del títol

- `titlepage: true` indica que volem una pàgina sencera per a títol.
- `titlepage-rule-height:mesura`  indica el grossor en punts d'una línea decorativa. Posar 0 si no volem tal línea.
- `titlepage-rule-color:RRGGBB` color de la línia en format RGB, on cada xifra és un hexadecimal.
- `titlepage-text-color:RRGGBB` color del text del títol en format RGB, on cada xifra és un hexadecimal.
- `titlepage-background:ruta_a_imatge` si volem posar una imatge de fons de la portada. L'ideal és combinar alguna imatge que tinga algun espai en blanc o en color suau (com puga ser una pissarra o finestra) i aprofitar dit espai per a ubicar el títol del document.

::: tip
- El color serà una valor en hexadecimal indicant la combinació RGB. Existeixen molts programes i/o webs que permeten seleccionar colors, com per exemple <https://htmlcolorcodes.com/es/>
- Es recomana ubicar totes les imatges en les que treballem dins d'una carpeta `img`, `imatges` o similar, per tindre-ho tot ben organitzat. Per accedir a la carpeta es posaria com si fos un enllaç `titlepage-background:img/portada.png`
:::

## Índex o taula de continguts

pandoc pot generar-nos automàticament la taula de continguts del nostre document, així com mantenir-la actualitzada amb la numeració de cada secció així com en quina pàgina apareix cada secció i altres. El requisit indispensable és afegir l'opció `--toc` (_table of contents_) per a que pandoc processe les marques de capçalera (`#`, `##`) com indicador de seccions.

A més a més, no cal numerar les sección, llavors en compte de fer:

```md
# 1. Introducció

# 2. Conceptes previs

## 2.1 Repàs del tema anterior
```

simplement deixarem:

```md
# Introducció

# Conceptes previs

## Repàs del tema anterior
```
Al compilar a PDF, haurem d'afegir l'opció `-N` per a que pandoc ens numere automàticament les seccions i subseccions que apareixeran.

La taula de continguts apareixerà en la primera fulla desprès de la pàgina de títol. Si volem que es quede en una única pàgina, de manera que la primera secció comence en una nova pàgina, haurem de afegir a la configuració:

```yaml
- toc-own-page: true
```

Si volem canviar el nom de la taula de continguts (per defecte serà **Índice** o **Índex**, depenent de `lang` escollit) haurem d'afegir:

```yaml
- toc-title: Continguts
```
 
Altra opció interessant és la profunditat de la taula de continguts, és a dir, fins a quin nivell de sub-sub-secció hem de mostrar a la taula de continguts. Aquesta opció ha de ser:

```yaml
- toc-depth: numero  # nivell de profunditat
```

## Capçaleres i peus de pàgina

Amb la capçalera YAML ens apareixen del directives per a controlar els encapçalats i peus de pàgina, de manera molt senzilla combinant totes aquestes: `[footer|header-left|center|right]`:

```yaml
header-left: UD 2. Passant a PDF
header-center: \thesection
header-right: Curs 2021-2022
footer-left: CEFIRE
footer-center: Markdown para la creación de recursos
footer-right: \thepage de \pageref{LastPage}
```

Com podeu veure, poden inclou-re's referències a la pàgina actual (`\thepage`), saber el nombre de pàgines `\pageref{LastPage}`, quina és la secció actual (el número, no el nom) i fins i tot el dia actual (`today`).



## Marca d'aigua

Si volem incloure una marca d'aigua a totes les pàgines del nostre document, tenim dos opcions, ambdues en la capçalera YAML (ja que afecta a tot el document):

1. Pròpia de la pantilla, afegint les següents directives:

```yaml
- page-background: ruta_a_la_imatge
- page-background-opacity: [0-1] 
```

- A la primera, indicarem la ruta a la imatge, tenint en compte que la imatge serà reescalada al tamany del paper (normalment A4), per la qual cosa escollir-la amb cura per a que no quede desproporcionada
- A la segona, s'indica el percentage d'opacitat, seguent 1 el 100% i 0 el 0%. Es recomana no siga elevada, donat que podriem _tapar_ el text. Sobre un 20% pot estar bé.

2. Amb el paquet `draftwatermark` de \LaTeX

Aquest paquet ens permet posar tant una imatge com un text, rotar-lo i modificar-li el tamany, tal i com s'intueix de l'exemple següent.

```yaml
   - \usepackage{draftwatermark}
   - \SetWatermarkText{\includegraphics{ruta_a_la_imatge}}
   - \SetWatermarkText{text_de_marca_d_aigua}
   - \SetWatermarkScale{0.5}
   - \SetWatermarkAngle{20}
```

Com pot veure's, podem establir una imatge o un text, simplement posant dins de `SetWatermarkText` be un text o be una imatge.

\newpage
# Valors afegits

## Comentaris al peu

Podem afegir comentaris al peu de la pàgina, com a referències, però tenir en compte que aquestes ixiran per dalt del peus de pàgina generals. Per a posar-los hem de fer una referència com segueix. Marcarem amb `[^n]` el número de la referència, per a desprès indicar el contingut de la referència que hem possat.

```md
Els camps `title`[^1], `subtitle`[^2], `author`[^3] i `abstract`[^4] indiquen tal i com representa el títol i subtítol, autors i resum del document. Aquesta informació s'inserta automàticament a la portada menys el resum que s'inserirà a la primera fulla desprès de la taula de continguts. 

[^1]: Títol
[^2]: Subtítol
[^3]: Autor
[^4]: Resum
```
Això implica que hem de duplicar la feina: posar la referència on volem que aparega per a desprès definir dita referència. Amb la extensió `inline_note` podem posar les notes al peu directament on apareixen, sense tindre que recordar la numeració o etiqueta ni duplicar-la:

```md
Els camps `title`^[Títol], `subtitle`^[Subtítol], `author`^[Autor] i `abstract`^[Resum] indiquen tal i com representa el títol i subtítol, autors i resum del document. Aquesta informació s'inserta automàticament a la portada menys el resum que s'inserirà a la primera fulla desprès de la taula de continguts. 

Aquesta informació podriem posar-la _ad-hoc_, però resulta més còmode d'aquesta manera, donat que podrem referenciar-la des de tot el document mitjançant etiquetes Latex, com poden ser `\thetitle` o `\theauthor`.
```

Aquesta opció quedaria al nostre document com es veu al següent paràgraf. 


Els camps `title`^[Títol], `subtitle`^[Subtítol], `author`^[Autor] i `abstract`^[Resum] indiquen tal i com representa el títol i subtítol, autors i resum del document. Observar el peu de la pàgina actual que s'han inserit els comentaris baix la pàgina però per sota del peu de pàgina general.

## Caixes i avisos

Markdown incorpora la possibilitat de afegir una nota per a recalcar algun contingut o concepte. Això pot fer-se amb:

```md
....
> Nota: recordar que els processadors de text...
...
```

el que produeix un text com segeuix:

> Nota: recordar que els processadors de text...

Si volem crear una sèrie de caixes per a distins formats de notes com avisos, perills, importants, etc podem aprofitar el paquet `awesomebox`, configurant la capçalera així:

```yaml
header-includes:
   - \usepackage{awesomebox}


pandoc-latex-environment:
   noteblock: [note]
   tipblock: [tip]
   warningblock: [warning]
   cautionblock: [caution]
   importantblock: [important]
```

Llavors crearem les caixes com si fos un bloc de codi, però en compte de tancar-lo amb tres accents greus  ho farem amb tres parell de dos punts (:::) i indicant el tipus de caixa. Haurem d'afegirt a la línia de compilació `--filter pandoc-latex-environment` per a definir els 5 tipus de caixes. 

```md
::: note
Anotació:   Lorem ipsum dolor sit amet, consectetur ad<ipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::

::: tip
Consell: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::

::: warning
Avís: Si poses `string` en compte de `String` en donarà molts **problemes**. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::

::: caution
Precaució: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::

::: important
Important: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::
```

El que produirà:

::: note
Anotació:   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::

::: tip
Consell: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::

::: warning
Avís: Si poses `string` en compte de `String` en donarà molts **problemes**. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::

::: caution
Precaució: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::

::: important
Important: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus.
:::

\newpage



En aquest últim apartat anem a veure una serie de _fórmules_ per a aconseguir alguns efectes de presentació més professionals. Recordar que l'objectiu del Markdown és centrar-se en el contingut i no en l'aspecte, però sempre que produim un PDF l'aspecte final del mateix és fonamental.

Per a moltes d'aquestes fórmules recurrirem als comandaments de \LaTeX, ja que com es diu _LaTeX és una imprenta a les teues mans_ i, tot i que pot resultar molt complicat al principi, és molt potent.

## Imatges i Columnes

### Imatges

::: note
Per al processament del següent apartat necessitarem afegir a la capçalera els següents paquets \LaTeX:
```latex
   - \usepackage{graphicx}
   - \usepackage{subfigure}
```
:::

Les imatges poden incloure-les amb el format natiu de markdown, podent modificar la dimensió de la mateixa:

```
![text alternatiu o capçalera](ruta a la imatge){modificors}
```

com per exemple:

```md
![Logo de Markdown](./img/Markdown.png){width=8cm} 
```

El mateix amb \LaTeX seria:

```latex
\begin{figure}
\includegraphics[width=6cm,angle=30]{./img/Markdown.png}
\caption{Logo de Markdown}
\end{figure}
```

podem observar que podem incloure l'opció de rotar-se la imatge un determinat angle, cosa que no podem fer amb Markdown directamet. El resultat seria:

\begin{figure}
\centering
\includegraphics[width=6cm,angle=30]{./img/Markdown.png}
\caption{Logo de Markdown}
\end{figure}

Fixar-se que:

- Ho posem tot dins d'un entorn `figure` dins dels blocs `begin` i `end`. 
- Centrem la imatge amb `\centering`
- Incrustem la imatge amb `\includegraphics[opcions]{ruta}`
  
::: tip

\LaTeX també inclou l'opció de mesurar les imatge com a percentatge de l'ample de la pàgina, posant `width=0.3\linewidth` (es veurà al següent exemple)
:::

Si volem situar dos o més imatges una al costat de l'altra, haurem de recòrrer al paquet `subfigure`. Mirem l'exemple següent:

```latex
\begin{figure}
\centering
\subfigure[la primera]{\includegraphics[width=0.3\linewidth]{./img/Markdown.png}}
\subfigure[la segona]{\includegraphics[width=0.3\linewidth]{./img/Markdown.png}}
\subfigure[la tercera]{\includegraphics[width=0.3\linewidth]{./img/Markdown.png}}
\caption{Mosaic.}
\end{figure}
```

el que ens dona:

\begin{figure}
\centering
\subfigure[la primera]{\includegraphics[width=0.3\linewidth]{./img/Markdown.png}}
\subfigure[la segona]{\includegraphics[width=0.3\linewidth]{./img/Markdown.png}}
\subfigure[la tercera]{\includegraphics[width=0.3\linewidth]{./img/Markdown.png}}
\caption{Mosaic.}
\end{figure}

Fixar-se que la generació d'una de les imatges menudes té les parts `\subfigure[retol]{\includegraphics[tamany]{imatge}`:
- El `retol`, que queda identificat automàticament.
- la imatge, tal i com feiem abans, amb la seua dimensió i ruta 

### Columnes

Posar el text en diverses columnes no és tan trivial com les imatges amb Markdown. Per a fer-ho caldra recurrir al paquet _multicols_. Per tant a l'apartat YAML haurem d'incloure (al subapartat de `header-includes`):

```yaml
header-includes:
   - \usepackage{multicol}
   - \setlength{\columnseprule}{1pt}
   - \setlength{\columnsep}{1em}
```

Significat de cada opció:

- `\usepackage{multicol}` ens inclou el paquet per a posar el text en distintes columnes.
- `\setlength{\columnseprule}{mesura}` li indiquem el grossor en cas de voler una línia vertical que ens separa les columnes. Si no en volem podem o be deixar-la a zero o be no posar aquesta opció. (al seu defecte pot deixar-se comentada)
- `\setlength{\columnsep}{mesura}` indiquem la separació que volem entre columnes

Tenir en compte que les mesures poden indicar-se en qualssevol d'aquestes unitats. Podeu provar-les per curiositat.

```yaml
pt: punt
pc: pica (12 pt)
in: polzada (72.27 pt)
bp: Big point (72 bp = 1 in)
cm: centímetres
mm: mil.limetres
dd: Punt Didot (0.0148 in)
cc: cicero (12 dd)
sp: Punt Scaled (65,536 sp = 1 pt)
ex: altura de la lletra `x`
em: amplària de la lletra `m`
px: Pixel (sols per a  pdfTeX i LuaTeX)
```

Un cop definides les opcions i mesures, l'unic que hem de fer per composar un text o porció del mateix entre columnes és:

```latex
\begin{multicols}{nombre de columnes}
...
text
...
\end{multicols}
```

Com per exemple:

```latex
\begin{multicols}{3}
...
text
...
\end{multicols}
```

podueix el text:

\begin{multicols}{3}
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque justo sit amet urna aliquam, dictum egestas felis dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras est tortor, maximus at nulla vitae, aliquet molestie felis. Integer hendrerit dignissim turpis. Vestibulum leo neque, aliquam sed nibh sit amet, dictum hendrerit purus. Donec pretium est id orci ornare sodales. Phasellus at nibh ornare, auctor lectus quis, vestibulum turpis. Suspendisse et turpis neque. Maecenas facilisis pharetra sem ac porttitor.

Proin eu congue neque. Sed dapibus eros sit amet eros rutrum pharetra. Vivamus ultrices dolor dolor, sed vehicula ipsum pulvinar et. Nullam nec elit eget erat aliquam tempus vel vitae velit. Vivamus non ante volutpat dolor hendrerit iaculis. Praesent id metus nisl. Sed eros erat, pulvinar vitae sem et, lobortis tempus dui. Proin id purus eget libero molestie varius sit amet sed turpis. In tincidunt sem vel augue ultricies, sit amet condimentum velit vestibulum. Nullam commodo ipsum ac felis pulvinar tempor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent venenatis mollis elementum. Curabitur et ex vitae elit interdum rhoncus. Nam id est nec purus lobortis finibus. Nam turpis elit, tempus a erat ut, pharetra commodo leo.
\end{multicols}

::: warning
Com estem dins d'un entorn \LaTeX, és a dir, entre un `\begin` i un `\end`, llavors ens apareix un problema, que no podem formatejar el text dins de les columnes amb comandaments de format de Markdown. Això vol dir que no podrem posar cursiva amb `*text en cursiva*`, ni posar un encapçalat amb `# titol`etc.
:::

#### Redefinint els blocs de \LaTeX

Per solucionar el problema vist anteriorment, la solució és fer creure a \LaTeX que no està dins d'un bloc \LaTeX, així podem seguir fent servir Markdown sense problema. Per a fer-ho hem de **redefinir** els comandaments `\begin` i `\end`, afegint en l'encapçalament:

```yaml
  - \newcommand{\hideFromPandoc}[1]{#1}
  - \hideFromPandoc {
      \let\Begin\begin
      \let\End\end
      }
```

A partir d'ara en compte de `\begin` i `\end` haurem de posar `\Begin` i `\End`, en majúscules, com veurem a continuació. Aquest paràgraf inicial:

```latex
\begin{multicols}{2}
Proin eu congue neque. Sed **dapibus** eros sit amet eros rutrum pharetra. Vivamus ultrices dolor dolor, sed vehicula ipsum *pulvinar* et. 
- element1
- element2
Nullam nec elit eget erat aliquam tempus vel vitae velit. Vivamus non ante volutpat dolor hendrerit iaculis. Praesent id ***metus*** nisl. Sed eros erat, pulvinar vitae sem et, lobortis tempus dui. Proin id purus eget libero molestie varius sit amet sed turpis. 
\end{multicols}
```
queda com segueix:

\begin{multicols}{2}
Proin eu congue neque. Sed **dapibus** eros sit amet eros rutrum pharetra. Vivamus ultrices dolor dolor, sed vehicula ipsum *pulvinar* et. 
- element1
- element2
Nullam nec elit eget erat aliquam tempus vel vitae velit. Vivamus non ante volutpat dolor hendrerit iaculis. Praesent id ***metus*** nisl. Sed eros erat, pulvinar vitae sem et, lobortis tempus dui. Proin id purus eget libero molestie varius sit amet sed turpis. 
\end{multicols}


Podem comprovar que al text tenim unes paraules que no les ha formatat (les que voliem posar en negreta, cursiva o ambdues coses), a l'igual que la llista. Al canviar les ordres d'inici i fi per `\Begin` i `\End` com es veu a continuació:

```latex
\Begin{multicols}{2}
Proin eu congue neque. Sed **dapibus** eros sit amet eros rutrum pharetra. Vivamus ultrices dolor dolor, sed vehicula ipsum *pulvinar* et. 
- element1
- element2
Nullam nec elit eget erat aliquam tempus vel vitae velit. Vivamus non ante volutpat dolor hendrerit iaculis. Praesent id ***metus*** nisl. Sed eros erat, pulvinar vitae sem et, lobortis tempus dui. Proin id purus eget libero molestie varius sit amet sed turpis. 

\End{multicols}
```

queda perfectemen en columnes i interpretat el Markdown.

\Begin{multicols}{2}
Proin eu congue neque. Sed **dapibus** eros sit amet eros rutrum pharetra. Vivamus ultrices dolor dolor, sed vehicula ipsum *pulvinar* et. 
- element1
- element2
Nullam nec elit eget erat aliquam tempus vel vitae velit. Vivamus non ante volutpat dolor hendrerit iaculis. Praesent id ***metus*** nisl. Sed eros erat, pulvinar vitae sem et, lobortis tempus dui. Proin id purus eget libero molestie varius sit amet sed turpis. 

\End{multicols}

::: warning

Fixeu-se que cal posar una linea en blanc abans del `\End{multicols}` per a que funcione de manera adequada, degut a la traducció que fa el preprocessador de \LaTeX entre el `\Begin` i el `\begin`
:::


## Pàgines apaïsades

De tant en tant, pot resultar-nos interessant el colocar alguna pàgina apaïsades, sobretot si tenim un gràfic ample que es queda menut dins d'una pàgina vertical o una gran taula amb moltes columnes. Per a poder fer-ho posarem, dins la capçalera el paquet `pdflscape`

```yaml
   - \usepackage{pdflscape}
```

i allò que volem que aparega en pàgina apaïsada ho posarem dins d'un bloc com segueix:

```
\begin{landscape}
contingut en horitzontal
\end{landscape}
```

Tot el que posem dins del contingut apaïssat provocarà automàticament un **bot de pàgina** des del punt on ens hem quedat en vertical, al contingut ja en horizontal, i quan acabe el contingut apaïssat ens posarà de nou un bot de línea al vertical.

::: note
On ens interesse posar un bot de pàgina, com per exemple al principi de cada secció, podem posar el comandament de \LaTeX `\newpage`
:::

::: warning
Atenció de nou, com estem dins d'un bloc \LaTeX, no podrem posar elements de Markdown com negreta, llista d'elements, seccions, etc. La solució de nou és fer servir com a inici i final del bloc apaïssat les instruccions `\Begin` i `\End`, tal i com hem definit en l'apartat de les columnes. La mateixa definició serveix per a ambós elements. Recordar que abans de `\End{seccio}` cal deixar una línia en blanc.
:::

# *Front matter* `yaml` amb totes les opcions

```yaml
---
# Metainformació del document
title: Exportant a PDF.  
titlepage: true
subtitle: Opcions avançades.
author: 
- Ferran
- Joan
- Jose
lang: ca

# portada
titlepage-rule-height: 2
titlepage-rule-color: AA0000
titlepage-text-color: AA0000
titlepage-background: ./img/portada.png

# configuració de l'índex
toc-own-page: true
toc-title: Continguts
toc-depth: 2

# capçalera i peu
header-left: \thetitle
header-right: Curs 2021-2022
footer-left: CEFIRE València
footer-right: \thepage/\pageref{LastPage}

# Les figures que apareguen on les definim i centrades
float-placement-figure: H
caption-justification: centering 

# No volem numerar les linies de codi
listings-disable-line-numbers: true

# Configuracions dels paquets de latex
header-includes:

  #  imatges i subfigures
   - \usepackage{graphicx}
   - \usepackage{subfigure}


 #  - \usepackage{adjustbox}
  # marca d'aigua
   - \usepackage{draftwatermark}
   - \SetWatermarkText{\includegraphics{./img/logo50water.png}}
   - \SetWatermarkScale{0.5}
   - \SetWatermarkAngle{20}
   
   # caixes d'avisos 
   - \usepackage{awesomebox}

   # text en columnes
   - \usepackage{multicol}
   - \setlength{\columnseprule}{1pt}
   - \setlength{\columnsep}{1em}

  # pàgines apaïsades
  - \usepackage{pdflscape}
  
  # per a permetre pandoc dins de blocs Latex
   - \newcommand{\hideFromPandoc}[1]{#1}
   - \hideFromPandoc {
        \let\Begin\begin
        \let\End\end
        }
 
# definició de les caixes d'avis
pandoc-latex-environment:
  noteblock: [note]
  tipblock: [tip]
  warningblock: [warning]
  cautionblock: [caution]
  importantblock: [important]
...
```

Les opcions que deuen d'apareixer a la crida a `pandoc` seran:

```bash
  --from markdown       # format d'oritge markdown
  -N                    # generar nombres de seccions
  --template eisvogel   # plantilla
  --toc                 # generar la taula de continguts
  --variable urlcolor=cyan  # color per a les URL
  --filter pandoc-latex-environment  # enviar a latex les constants
  --listings            # interpretar els blocs de codi
<<<<<<< HEAD
```
=======
  --pdf-engine xelatex
```
>>>>>>> 7e474ca08b23ff45caec9ed83541ba999e81dfc1
