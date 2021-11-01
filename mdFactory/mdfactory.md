# El paquet mdfactory

Als repositoris de Justix disposem del paquet mdfactory, que incorpora:

* La plantilla Eisvogel, utilitzada per generar els pdf,
* Un script `md2pdf`, per generar el pdf a partir d'un document markdown, simplificant les invocacions a Pandoc,
* Totes les dependències necessàries per generar aquests documents.

En futures versions, incorporarem també un script per generar paquets SCORM, compatibles amb Moodle.


## Instal·lació

Per instal·lar aquest paquet, necessitarem una Ubuntu 20.04.

En primer lloc, afegirem el ppa de la Justix:

```
sudo add-apt-repository ppa:ieseljust/focal
```

Actualitzem la caché de paquets:

```
sudo apt update
```

I instal·lem:

```
sudo apt install mdfactory
```

Aquest paquet inclou moltes dependències de Pandoc addicionals, pel que la descàrrega pot ser lenta.

## Conversió de MD a PDF amb md2pdf

Podeu consultar a [Github el codi de l'script md2pf](https://github.com/joamuran/mdfactory/blob/master/mdfactory/usr/bin/md2pdf), per veure internament tot el que fa.

La sintaxi de l'script és la següent:

```
md2pdf [-n] [-f] Fitxer.md
```

Que generarà el fitxer `Fitxer.pdf` a partir del fitxer `Fitxer.md`. Les opcions que té són:

* `-n`: Permet numerar automàticament els apartats
* `-f`: Força l'escriptura del fitxer d'eixida, encara que aquest ja existisca. Si no l'afegim i el fitxer pdf ja existeix, s'aturarà.

