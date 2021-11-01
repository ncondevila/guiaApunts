---
title: Introducció a Markdown
subtitle: Afegint metadades amb YAML
author: 
- Ferran
- Joan
- Jose
abstract: |
  YAML és un altre llenguatge de marcat lleuger (YAML Ain't a Markup Language)

  El bloc de metadades d'un document va expressat amb aquest format.
lang: ca
titlepage: true
titlepage-rule-height: 0
titlepage-rule-color: 653097
toc-own-page: true
toc-title: Continguts
header-left: UD 1. Introducció a Markdown
header-right: Curs 2021-2022
footer-left: IES Jaume II el Just - PSP
footer-right: \thepage/\pageref{LastPage}
titlepage-background: img/portada.png
---


# El bloc de metadades YAML

YAML es pot considerar altre llenguatge de marcat lleuger. Es tracta d'un format de serialització semblant a JSON però si cap, més legible.

YAML sol utilitzar-se batant en fitxers de configuració. Al nostre cas, l'utilitzarem per definir un bloc de metadades d'un document Markdown. Aquest bloc de dades, en altres contextos com ara el generador de llocs webs estàtics Hugo, s'anomena *front-matter*.

Es tracta d'un bloc que es sitúa generalment a la part superior del fitxer, i que comença i acaba amb tres guions (---). El fet de situar al bloc al principi és perquè ens dona una visió general de la informació del document només obrir-lo, però pot anar en qualsevol lloc del document. 

Com que Pandoc permet incloure diversos fitxers en la conversió, podem utilitzar un fitxer YAML per tal de conserver les metadades en aquest, i passar-lo com si for un fitxer font més. Per exemple:

```
pandoc seccio1.md seccio2.md seccio3.md metadades.yaml -s -o tema.html
```

Alternativament, també podem utilitzar l'opció `--metadata-file`.

### Sintaxi YAML 

* L'estructura del document ve determinada per la **indentació amb espais en blanc** (no tabulacions).
* Les **llistes** d'elements comencen amb un guió (`-`), o bé, si es posen en una sola línia entre corxetes (`[]`) i separades per una coma i espai (`, `).
* ELs **vectors** associatius es representen amb els dos punts, seguits d'un espai, en la forma `clau: valor`, amb un component per línia, si volem afegir diversos components en una línia els tanquem entre claus i els separem amb una línia i un espai, (`{clau1: valor1, clau2: valor2 }`).
* Els **valoes escalars simples** apareixen sense cometes, però poden anar entre cometes dobles (`"`) o simples (`'`).
* Podem afegir **comentaris** precedint la línia amb `#`.
* Recordeu que quan utilitzem una coma o un punt com a separador, cal afegir un espai al darrere. D'aquesta manera, podem representar valors escalars amb signes de puntuació sense necessitat d'afegir cometes.
* Si un valor conté, per exemple el signe dels dos punts, aquest s'ha d'escapar, i si té la contrabarra, cal assegurar-se que no es tracte com a seqüències d'escamapent YAML. 
* Podem utilitzar canonades per iniciar un bloc de sagnat que s'interpretarà literalment, sense necessitat d'escapa res. És útil quan un camp conté línes en blanc.

## Exemple 

Aquest és un exemple de bloc YAML de metadades per a un document, on es defineixen diferents valors que després es poden utilitzar en la plantilla.

```yaml
---
title: Introducció a Markdown
subtitle: Afegint metadades amb YAML
author: 
- Ferran
- Joan
- Jose
abstract: |
  YAML és un altre llenguatge de marcat lleuger (YAML Ain't a Markup Language)

  El bloc de metadades d'un document va expressat amb aquest format.
lang: ca
titlepage: true
titlepage-rule-height: 0
titlepage-rule-color: 653097
toc-own-page: true
toc-title: Continguts
header-left: UD 1. Introducció a Markdown
header-right: Curs 2021-2022
footer-left: IES Jaume II el Just - PSP
footer-right: \thepage/\pageref{LastPage}
titlepage-background: img/portada.png
---
```

Com sempre, disposeu de més informació, incloses les directives de LaTeX per tractar aquestes metadades en la generació del document al [manual de Pandoc](https://pandoc.org/MANUAL.html#metadata-blocks).