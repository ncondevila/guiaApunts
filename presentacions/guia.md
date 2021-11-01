---
title: Marpit tutorial
description: Tutorial de marpit/marp per a fer presentacions en markdown
marp: true
theme: default
paginate: true
_paginate: false
_header: 'IES Jaume II "El Just'
_footer: 'Curs 21/22'
style: |
  h1{
    text-align: center;
    font-size: 150px;
    background-color: #ccc;
  }
---

# Presentacions amb Marpit/Marp

---
# Què és?

És una ferramenta per a crear presentacions que ransforma **markdown + CSS** en presentacions **HTML + CSS, PDF, PPTX, ...**

---
# Instal·lació de Marp

Per a instal·lar **Marp**, que és el programa que ens transforma **Marpit** en presentacions, utilitzem el gestor de paquets **npm** (*node package manager*).

Instal·leu *Marp for VS Code* en cas d'utilitzar l'VS Code per a poder previsualitzar el resultat (heu de configurar la directiva marp: true). 

~~~bash
$ curl -sL https://deb.nodesource.com/setup_14.x | sudo bash - # Ens afegix els repositori per a instal·lar nodejs v14.X
$ sudo apt install nodejs
$ sudo apt install npm
$ sudo npm install -g @marp-team/marp-cli
$ sudo apt install chromium-browser # Sols si no teniu el chrome o chromium
~~~

---
# Com utilitzar Marpit

* Per a canviar de diapositiva ja hem vist que gastem "---" amb una línia en blanc al davant.
* També es pot utilitzar ___, *** o - - - (sense línia obligatòriament)
* El contingut l'escrivim directament amn markdown

---
# Exemple

```markdown
---
# Diapositiva 1

IES Jaume II "El Just"

---
# Diapositiva 2

Curs 2021/22

```

---
# Diapositiva 1

IES Jaume II "El Just"

---
# Diapositiva 2

Curs 2021/22

---
# Ús de **directives**

Amb directives podem controlar el tema, la numeració de pàgines, l'encapçalament, el peu de pàgina, l'estil, etc.

---
Hi ha dos formes d'ús de directives:

1. Sintaxi de "bloc YAML":
   
```markdown
---
theme: default
paginate: true
---
```

2. Sintaxi de comentari d'html:

```html
<!--
theme: default
paginate: true
-->
```

---
<!-- backgroundColor: aqua -->
S'apliquen a partir de la diapositiva on les utilitzem i es mantenen mentre no canviem la directiva.

```
<!-- backgroundColor: aqua -->
```

---

---
<!-- _backgroundColor: red -->
Si volem aplicar una directiva sols a una dispositiva utilitzem el guió baix:

```
<!-- _backgroundColor: red -->
```

---
<!-- backgroundColor: white -->
# Directives globals

| Nom            | Descripció                                                          |
| -------------- | ------------------------------------------------------------------- |
| theme          | Especifica el tema per a tota la presentació                        |
| style          | Especifica l'estil per a tota la presentació                        |
| headingDivider | Opció per a dividr les diapositives a través del nivell dels títols |

---

```markdown
<!-- headingDivider: 2 -->

# Diapositiva 1

Contingut de la 1a diapositiva

## Disapositiva 2

### Contingut de la 3a diapositiva

Hello, world!

# Disapositiva 3
```

---
# Directives locals

<style scope> table{ font-size: 20px; }</style>

| Nom                | Descripció                                                           |
| ------------------ | -------------------------------------------------------------------- |
| paginate           | Mostra números de pàgina                                             |
| header             | Contingut de la capçalera                                            |
| footer             | Contingut del peu de diapositiva                                     |
| class              | Especifiqueu la classe HTML de l'element <section> de la diapositiva |
| backgroundColor    | Color de fons de la diapositiva                                      |
| backgroundImage    | Imatge de fons de la diapositiva                                     |
| backgroundPosition | Posició de fons de la diapositiva                                    |
| backgroundRepeat   | Repetició de fons de diapositiva                                     |
| backgroundSize     | Mida de fons de la diapositiva                                       |
| color              | Color de lletra de la diapositiva                                    |

---
# Paginació

```html
---
marp: true
paginate: true
---
<!-- _paginate: false -->
# Primera disapositiva

No numerada
---
# Segona diapositiva

Numerada

```

---

# Aplicant estils a les diapositives

Per a aplicar estils utilitzem CSS.
CSS és l'estàndar utilitzat a la web per a configurar l'aparença de les pàgines.
Està basat en regles de la forma:
```css
<style scoped> h1{ font-size: 70%; }</style>
```
Amb scoped, apliquem les regles sols a la diapositiva, si ho llevem, a tot el document.

---

# Regles CSS

```
element {atribut: valor}
```
---

<style scoped>
  table{
    font-size: 65%;
  }
</style>

# Elements importants CSS per a les nostres diapositives

| Element    | Descripció                       |
| ---------- | -------------------------------- |
| section    | Dispositiva                      |
| h1 ... h6  | Encapçalaments                   |
| p          | paràgraf                         |
| table      | taules                           |
| ul         | Elements de llistes desordenades |
| ol         | Elements de llistes ordenades    |
| img        | Imatges                          |
| code       | Markdown marcat amb ```          |
| blockquote | Markdown marcat amb >            |

---
# Alguns atributs CSS importants

Els principals atributs que utilitzareu, seran:

* font-size: 20px
  * Per a canviar el tamany de lletra
* color: red
  * Per a canviar el color de la lletra. No confondre amb la directiva backgrounColor.
* text-align: center | left | right | justify
  * Per a aliniar el text a dreta, esquerra o centre.
* background-color: red
  * Per a definir el color de fons sense utilitzar la directiva.
* font-family: "Times New Roman", Times, serif;
  * Per a canviar el tipus de lletra
* border: 5px solid red;
  * Per a definir bordes als elements

---

# Tractament d'imatges

Ja sabem com introduir imatges utilitzant markdown, però ens interessa poder modificar el seu tamany per exemple.

## Tamany

```markdown
![w:100px](images/muntanyes.jpg) Amplada de 100px

![width:200px](images/muntanyes.jpg) Amplada de 200px

![width:200px height:50px](images/muntanyes.jpg) Amplada de 200px i altura de 50px
```

---

![w:100px](images/muntanyes.jpg) Amplada de 100px

![width:200px](images/muntanyes.jpg) Amplada de 200px

![width:200px height:50px](images/muntanyes.jpg) Amplada de 200px i altura de 50px

---

## Filtres sobre imatges
Es poden aplicar combinacions de filtres a les imatges.
```
![blur]()	        ![blur:10px]()
![brightness]()	        ![brightness:1.5]()
![contrast]()	        ![contrast:200%]()
![drop-shadow]()	![drop-shadow:0,5px,10px,rgba(0,0,0,.4)]()
![grayscale]()	        ![grayscale:1]()
![hue-rotate]()	        ![hue-rotate:180deg]()
![invert]()	        ![invert:100%]()
![opacity]()	        ![opacity:.5]()
![saturate]()	        ![saturate:2.0]()
![sepia]()	        ![sepia:1.0]()
```
---

![drop-shadow:50px,50px,10px,rgba(0,0,0,.4) invert width:300px](images/muntanyes.jpg)
```
![drop-shadow:50px,50px,10px,rgba(0,0,0,.4) invert width:500px](images/muntanyes.jpg)
```
---

# Imatges com a background

```markdown
![bg](images/llapiços.jpg)
```

![bg](images/llapiços.jpg)

---
# Tamany de background
| Modificador | Descripció                                            |
| ----------- | ----------------------------------------------------- |
| cover       | Escala la imatge per omplir la diapositiva. (Default) |
| contain     | Escala la imatge per ajustar a la diapositiva.        |
| auto        | No escala, tamany original                            |
| x%          | Escala al percentatge indicat                         |

---

```markdown
![bg contain](images/llapiços.jpg)
```

![bg contain](images/llapiços.jpg)

---

```markdown
![bg 40%](images/llapiços.jpg)
```

![bg 40%](images/llapiços.jpg)

---
<style>
  h1 {
    text-align: center;
    font-size: 130%;
  }
</style>
# Backgrounds múltiples
```
![bg](images/colors.jpg)
![bg](images/llapiços.jpg)
![bg](images/muntanyes.jpg)
```

![bg](images/colors.jpg)
![bg](images/llapiços.jpg)
![bg](images/muntanyes.jpg)

---

# Backgrounds múltiples
```
![bg vertical sepia](images/colors.jpg)
![bg sepia](images/llapiços.jpg)
![bg sepia](images/muntanyes.jpg)
```

![bg vertical sepia](images/colors.jpg)
![bg sepia](images/llapiços.jpg)
![bg sepia](images/muntanyes.jpg)

---

# Partir l'espai

![bg left](images/muntanyes.jpg)

El contingut de la diapositiva es situa a l'esquerra. Inclús el *header* i el *footer*.

---

```markdown
![bg left:33%](images/colors.jpg)
![bg](images/llapiços.jpg)
![bg](images/muntanyes.jpg)
```

![bg left:33%](images/colors.jpg)
![bg](images/llapiços.jpg)
![bg](images/muntanyes.jpg)

---

```markdown
![bg right:25%](images/colors.jpg)
```

![bg right:25%](images/colors.jpg)

---
# Transformem el .md a html, pdf, pptx, ...

Per a transformar la presentació en .md a altres formats, utilitzarem **marp**.

```bash
$ marp -h # Per veure les opcions
$ marp <arxiu.md> # Per a convertir a pàgina web
$ marp --pptx <arxiu.md> # Per a convertir a pptx
$ marp --pdf --allow-local-files <arxiu.md> # Per a passar a pdf
      # amb --allow-local-files permetem que accedisca a imatges locals
      # si les imatges estan a internet, no cal
```
També podeu utilitzar l'extensió de Marp al VS Code per a exportar.

---
<style scoped>
  p {
    font-size: 80%
  }
</style>
Els pdf ocupen molt perquè realment cada diapositiva és una imatge. Els podem reduir amb ghostscript:
```bash
$ gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET
        -dBATCH -sOutputFile=pdf_reducido.pdf pdf_original.pdf 
```
On -dPDFSETTINGS pot agafar els següents valors. Per a presentacions sobra amb qualitat screen.

dPDFSETTINGS=/**screen** (72 dpi, qualitat baixa)
dPDFSETTINGS=/**ebook** (150 dpi, qualitat mitja)
dPDFSETTINGS=/**printer** (300 dpi, alta qualitat)
dPDFSETTINGS=/**prepress** (300 dpi, alta qualitat preservant el color)
dPDFSETTINGS=/**default** (quasi idèntic a screen, però amb qualitat lleugerament superior)

Exemple:
```bash
$ gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET 
  -dBATCH -sOutputFile=marpit_red.pdf marpit.pdf
$ ls -lh | grep pdf
-rw-rw-r-- 1 ferran ferran  50M Feb 26 16:58 marpit.pdf
-rw-rw-r-- 1 ferran ferran 757K Feb 26 16:48 marpit_red.pdf
```