sysdir set PLUS "d:\ado\plus"
sysdir set PERSONAL "d:\ado\personal"
set scheme Burd4, permanently

**************************
* profile.do Ined        *
* M.Thevenin Ined-SMS *
**************************


*****************************
* ado + et personal dans D: *
***************************** 
sysdir set PLUS "d:\ado\plus"
sysdir set PERSONAL "d:\ado\personal"


*****************
* R source path *
*****************
global Rterm_path `"C:\Program Files\R\R-3.4.2\bin\i386\R.exe"'
global Rterm_options `"--slave --vanilla --args  "`tf1'" "`tf2'" "'


***************************************************
* supprimer le blocage du défilement  de l'output *
***************************************************
set more off, permanently

set rmsg off






