#Gnuplot script to plot base state functions

set terminal epslatex standalone

set output "base_state.tex"

set ylabel '\Large z' rotate by 0

phi(x) = x > 0.5 ? -log(2.0 * (1.0 - x)):log(2.0 * x)
s(x) = x < 0.5 ? -log(2.0 * x):log(2.0 * (1.0 - x))

set xrange[0:1]
set yrange[-6.5:6.5]

set samples 2000

unset border

unset xtics
unset ytics

set arrow from 0,0 to 1,0 nohead
set arrow from 0,-6.5 to 0,6.5
set arrow from 1,-6.5 to 1,6.5

set arrow from 0.25,0 to 0.25,0.3 nohead
set arrow from 0.5,0 to 0.5,0.3 nohead
set arrow from 0.75,0 to 0.75,0.3 nohead
set arrow from 1,0 to 1,0.3 nohead

set arrow from 0,-2 to 0.02,-2 nohead
set arrow from 0,-4 to 0.02,-4 nohead
set arrow from 0,-6 to 0.02,-6 nohead
set arrow from 0,2 to 0.02,2 nohead
set arrow from 0,4 to 0.02,4 nohead
set arrow from 0,6 to 0.02,6 nohead

set arrow from 1,-2 to 0.98,-2 nohead
set arrow from 1,-4 to 0.98,-4 nohead
set arrow from 1,-6 to 0.98,-6 nohead
set arrow from 1,2 to 0.98,2 nohead
set arrow from 1,4 to 0.98,4 nohead
set arrow from 1,6 to 0.98,6 nohead

set label '\Large $0$' at -0.03,-0.4
set label '\Large $1/4$' at 0.2,-0.4
set label '\Large $1/2$' at 0.467,-0.5
set label '\Large $3/4$' at 0.7375,-0.4
set label '\Large $1$' at 0.975,-0.4

set label '\Large \color{blue} $-2 L_{\text{p}}$' at -0.115, -2
set label '\Large \color{blue} $-4 L_{\text{p}}$' at -0.115, -4
set label '\Large \color{blue} $-6 L_{\text{p}}$' at -0.115, -6
set label '\Large \color{blue} $2 L_{\text{p}}$' at -0.0775, 2
set label '\Large \color{blue} $4 L_{\text{p}}$' at -0.0775, 4
set label '\Large \color{blue} $6 L_{\text{p}}$' at -0.0775, 6

set label '\Large \color{red} $-2 L_{\text{s}}$' at 1, -2
set label '\Large \color{red} $-4 L_{\text{s}}$' at 1, -4
set label '\Large \color{red} $-6 L_{\text{s}}$' at 1, -6
set label '\Large \color{red} $2 L_{\text{s}}$' at 1.01, 2
set label '\Large \color{red} $4 L_{\text{s}}$' at 1.01, 4
set label '\Large \color{red} $6 L_{\text{s}}$' at 1.01, 6

set label '\Large \color{blue} $\frac{\phi}{\phi_{0}} = \begin{cases} \frac{1}{2} \exp\left(\frac{z}{L_{\text{p}}}\right), & x \leq 0 \\ 1 - \frac{1}{2} \exp\left(\frac{-z}{L_{\text{p}}}\right), & x > 0 \end{cases}$' at 0.15,4

set label '\Large \color{red} $\frac{s}{s_{0}} = \begin{cases} 1 - \frac{1}{2} \exp\left(\frac{z}{L_{\text{s}}}\right), & x \leq 0 \\ \frac{1}{2} \exp\left(\frac{-z}{L_{\text{s}}}\right), & x > 0 \end{cases}$' at 0.15,-4

set lmargin 5
set rmargin 5
unset key

plot [0.001:0.999] phi(x) lc 6 lw 2 title '$\phi(z)$', [0.001:0.999] s(x) lc 7 lw 2  title '$s(z)$'
