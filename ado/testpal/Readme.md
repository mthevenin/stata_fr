---
title: "Commande testpal"
author: "Marc Thevenin"
date: "14/06/2022"
#output:
#  html_document:
#    toc: yes
---


# Commande testpal

Permet de tester une palette sur un graphique témoin

## Installation

**`net install testpal, from("https://raw.githubusercontent.com/mthevenin/stata_fr/master/ado/testpal/") replace`**

## Syntaxe

**`testpal nom_palette , [rev] [op(#)] [bf(#)]`**

* **`rev`**: inverse l'ordre des couleurs de la palette
* **`op(#)`**: modifie le pourcentage d'opacité des couleurs. Par défaut l'opacité est de 100%: `op(100)`. # est compris entre 0+ et 100.
* **`bf(#)`**: permet de modifier la clarté de la couleur de fond des graphiques de la seconde colonne (fixé à blanc pour la première). # est une valeur comprise entre 1 (noir) et 14 (presque blanc). 

## Exemples

Collection ***Brewer***, palette ***YlGnBu***:  
```{}
testpal YlGnBu, rev op(50) bf(5) 
```
![](testpal1.png)

Collection ***tableau***, palette ***10***:

```{}
testpal tab 10 , rev op(100) bf(1)
```

![](testpal2.png)


