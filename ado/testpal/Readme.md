---
title: "commande testpal"
author: "Marc Thevenin"
date: "14/06/2022"
#output:
#  html_document:
#    toc: yes
---


# commande testpal

Permet de tester une paletter sur un graphique témoin

## Installation

**`net install testpal, from("https://mthevenin.github.io/stata_fr/ado/testpal/") replace`**

## Syntaxe

**`testpal *nom_palette* , [rev] [op(#)] [bf(#)]`**

* **`rev`**: inverse l'ordre des couleurs de la palette
* **`op(#)`**: modifie le pourcentage d'opacité des couleurs. Par défaut 80% (op(80)). # est compris entre 0+ et 100.
* **`bf(#)`**: permet de modifier la clareté des graphiques de la seconde colonne (blanc pour la première). # est une valeur comprise entre 1 (noir) et 14 (presque blanc). 

## Exemples

**`testpal YlGnBu, rev op(50) bf(5)`**  
<br>

![](img/testpal1.png)

