*! version 1.0  2022 [Marc Thevenin INED-SMS]

capt program drop testpal
program define testpal

syntax anything , [op(integer 100)] [rev] [bf(integer 2)] 


* Dépendance: installation de colorpalette et grstyle 
local packg colorpalette grstyle
foreach p of local packg {
capture which `p'
if _rc==111 ssc install `p'
} 


preserve

clear
set obs 1000

gen y1= rnormal(0,1.5)
gen y2= rnormal(3, 2)
gen y3= rnormal(6, 3)
gen y4= rnormal(9, 4)
gen y5= rnormal(12, 5)
gen y6= rnormal(15, 6)

forv i=1/6 {
kdensity y`i', n(500) gen(x`i' d`i') nograph
}


local pal `anything'

grstyle init
grstyle set mesh, compact horizontal


colorpalette `pal', n(6) opacity(`op') nograph `rev' 
local ops lc(black) lw(*.5)
#delimit ;
tw line d1 x1,  recast(area) `ops' fc("`r(p1)'")  
|| line d2 x2,  recast(area) `ops' fc("`r(p2)'")
|| line d3 x3,  recast(area) `ops' fc("`r(p3)'") 
|| line d4 x4,  recast(area) `ops' fc("`r(p4)'")
|| line d5 x5,  recast(area) `ops' fc("`r(p5)'")
|| line d6 x6,  recast(area) `ops' fc("`r(p6)'")
||, legend(order(1 "r(p1)" 2 "r(p2)" 3 "r(p3)" 4 "r(p4)" 5 "r(p5)" 6 "r(p6)") pos(11) row(2) region(color(%0)))
name(g1, replace)  nodraw
;
#delimit cr


colorpalette `pal', n(6) opacity(`op') nograph `rev'
local ops lc(black) lw(*.5)  
#delimit ;
tw line d1 x1,  recast(area) `ops' fc("`r(p1)'")  
|| line d2 x2,  recast(area) `ops' fc("`r(p2)'")
|| line d3 x3,  recast(area) `ops' fc("`r(p3)'") 
|| line d4 x4,  recast(area) `ops' fc("`r(p4)'")
|| line d5 x5,  recast(area) `ops' fc("`r(p5)'")
|| line d6 x6,  recast(area) `ops' fc("`r(p6)'")
||, legend(order(1 "r(p1)" 2 "r(p2)" 3 "r(p3)" 4 "r(p4)" 5 "r(p5)" 6 "r(p6)") pos(11) row(2) region(color(%0)) color(gs11))
graphr(color(gs`bf')) plotr(color(gs`bf'))
name(g2, replace) nodraw
;
#delimit cr


colorpalette `pal', n(6) opacity(`op')  nograph  `rev' 
local ops lc(black) lw(*1.5)
#delimit ;
tw line d1 x1,   `ops' lc("`r(p1)'")  
|| line d2 x2,   `ops' lc("`r(p2)'")
|| line d3 x3,   `ops' lc("`r(p3)'") 
|| line d4 x4,   `ops' lc("`r(p4)'")
|| line d5 x5,   `ops' lc("`r(p5)'")
|| line d6 x6,   `ops' lc("`r(p6)'")
||, legend(order(1 "r(p1)" 2 "r(p2)" 3 "r(p3)" 4 "r(p4)" 5 "r(p5)" 6 "r(p6)") pos(11) row(2) region(color(%0)))
name(g3, replace) nodraw
;
#delimit cr

colorpalette `pal', n(6) opacity(`op') nograph `rev' 
local ops lc(black) lw(*1.5)
#delimit ;
tw line d1 x1,   `ops' lc("`r(p1)'")  
|| line d2 x2,   `ops' lc("`r(p2)'")
|| line d3 x3,   `ops' lc("`r(p3)'") 
|| line d4 x4,   `ops' lc("`r(p4)'")
|| line d5 x5,   `ops' lc("`r(p5)'")
|| line d6 x6,   `ops' lc("`r(p6)'")
||, legend(order(1 "r(p1)" 2 "r(p2)" 3 "r(p3)" 4 "r(p4)" 5 "r(p5)" 6 "r(p6)") pos(11) row(2) region(color(%0)) color(gs11))
graphr(color(gs`bf')) plotr(color(gs`bf'))
name(g4, replace) nodraw
;
#delimit cr

graph combine g1 g2 g3 g4, iscale(*.8)   title("palette = `pal'")


restore

end
