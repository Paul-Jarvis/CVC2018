#Gnuplot script to plot the initial configuration for the static experiments

set terminal epslatex standalone size 7cm, 9cm

set output "unstable_config.tex"

#set xlabel '$\rho$'
set ylabel '\Large z' rotate by 0

unset xtics
unset ytics

set yrange[-5:5]
set xrange[0:3]

set arrow from 0,0 to 0,5.5 lw 6   
set arrow from 0,0 to 3.5,0 lw 6
set label '\Large $\rho$' at 3.25,0.5   
set size ratio 2
   
set samples 1000

unset border

set xzeroaxis
set yzeroaxis

set parametric
set trange[-5:5]

set key spacing 1.5 at 5, 5
   
set tmargin 2
   set lmargin at screen 0.1
   
fx(t) = 1
fy(t) = t
   
gx(t) = t > -1 ? 1.75:0
gy(t) = t
   
hx(t) = t < 0 ? 2:0
hy(t) = t

ix(t) = t < -1 ? 2.1: t < 0 ? 2.75:1.85
iy(t) = t

set label '\Large $\rho_{0}$' at 0.9,5.5

set label '\Large $\rho_{\text{p}} \phi$' at 1.1,2.5
set arrow from 1,2 to 1.75,2
set arrow from 1.75,2 to 1,2

set label '\Large $\rho_{0} \alpha s$' at 1.15,-1.6
set arrow from 1,-2 to 2,-2
set arrow from 2,-2 to 1,-2

set label '\Large $U_{\text{p}} \Delta t$' at 3.3,-0.5
set arrow from 3.2,0 to 3.2,-1
set arrow from 3.2,-1 to 3.2,0
   
plot fx(t), fy(t) lw 4 title '\Large $\rho_{0}$',\
     gx(t), gy(t) lw 4 title '\Large $\rho_{0} + \rho_{\text{p}} \phi$',\
     hx(t), hy(t) lw 4 lc 7 title '\Large $\rho_{0} (1 + \alpha s)$',\
     ix(t), iy(t) lw 4 title '\Large $\rho$
