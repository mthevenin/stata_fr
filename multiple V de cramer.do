webuse lbw, clear
local var race smoke ptl ht ui
local c: word count `var'

matrix V = J(`c',`c',`c')
local i = 0
foreach v1 of local var {
local i = `i' + 1
local j = 0
foreach v2 of local var {
local j = `j' + 1
qui tab `v1' `v2', V
mat V[`i',`j'] = r(CramersV)
}
}
matrix rownames V = `var'
matrix colnames V = `var'

local rn : rowfullnames V

qui gen _Var1 = ""
forvalues i = 1/`c' {
    qui replace _Var1 = "`:word `i' of `rn''" in `i'
	}
qui gen _Var2 = _Var1[_n-1]

qui svmat V, n(matcol)

local k=1
local l=1
*local c2= `c'-1
foreach v of local var {
qui replace V`v'=. in 1/`k++'
qui egen _maxV`v'=max(V`v') in 1/`c'
qui replace _maxV`v'=. in 1/`l++'
qui gen _SmaxV`v'=sum(_maxV`v') in 1/`c'
qui replace _maxV`v'=. if _SmaxV`v'!=_maxV`v'
drop V`v' _SmaxV`v'
local maxV `maxV' _maxV`v'
}

qui egen _maxCram=rowtotal(`maxV')
qui replace _maxCram=. if _maxCram==0
qui drop _maxV*
qui egen  _maxCram2=max(_maxCram)
qui gen _X=1 if _maxCram2==_maxCram

di " Matrice des v de Cramer"
matlist V

di "V de Cramer max"
list _Var1 _Var2 _maxCram2 if _X==1
drop _Var* _max* _X
