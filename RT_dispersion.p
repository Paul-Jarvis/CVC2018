#Gnuplot script to produce a presentation quality plot of growth rate as a
#function of the wavenumber and A_beta for a constant transition length

set terminal epslatex standalone

set output 'RT_dispersion.tex'
   
set multiplot
   
set xrange[1:1024]
set yrange[0.01:20]
   
set logscale x
set logscale y   

set xlabel '\Large $k$'
   set label '\Large $\omega$' at 0.5, 0.35

set xtics ('\Large 1' 1, '\Large 10' 10, '\Large 100' 100, '\Large 1000' 1000)   
set ytics ('\Large 0.01' 0.01, '\Large 0.1' 0.1, '\Large 1' 1, '\Large 10' 10)   

set lmargin 5
set rmargin 10   
   
set key at 6000, 5 notitle spacing 1.5 samplen 0.0001 #vertical maxrows 3

set label '\Large $\beta$' at 2500, 8
   
plot 'eig_vals.dat' u 1:($2 == 0.01 && $3 == 16.384   ? abs($4):1/0) ps 2 title '\Large 163840'  ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 4.096    ? abs($4):1/0) ps 2 title '\Large 40960'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 1.024    ? abs($4):1/0) ps 2 title '\Large 10240'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.256    ? abs($4):1/0) ps 2 title '\Large 2560'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.064    ? abs($4):1/0) ps 2 title '\Large 640'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.016    ? abs($4):1/0) ps 2 title '\Large 160'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.004    ? abs($4):1/0) ps 2 title '\Large 40'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.001    ? abs($4):1/0) ps 2 title '\Large 10'
   

set size 0.59, 0.25
   set origin 0.4, 0.13

unset key
unset label


unset xlabel
unset ylabel

unset xtics
unset ytics   
set xtics format ""
set ytics format ""

set xrange[*:*]
set yrange[*:*]

set label 1 '\normalsize $\frac{\sigma}{\sqrt A_{\beta}}$' at 0.1, 1
set label 2 '\normalsize 0.1' at 0.4, 0.15
set label 3 '\normalsize 1' at 0.5, 1
set label 4 '\normalsize 10' at 0.45, 8
   set label 5 '\normalsize $\sim k^{1/2}$' at 1.5, 3    
      set label 6 '\normalsize $\sim k^{0}$' at 130, 0.9
set arrow 1 from 1, 0.1 to 0.00015, 0.039 nohead
set arrow 2 from 1000, 0.1 to 1300, 0.039 nohead
   
plot 'eig_vals.dat' u 1:($2 == 0.01 && $3 == 16.384   ? abs($4) / sqrt($3):1/0) ps 2 title '16.384'  ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 4.096    ? abs($4) / sqrt($3):1/0) ps 2 title '4.096'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 1.024    ? abs($4) / sqrt($3):1/0) ps 2 title '1.024'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.256    ? abs($4) / sqrt($3):1/0) ps 2 title '0.256'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.064    ? abs($4) / sqrt($3):1/0) ps 2 title '0.064'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.016    ? abs($4) / sqrt($3):1/0) ps 2 title '0.016'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.004    ? abs($4) / sqrt($3):1/0) ps 2 title '0.004'   ,\
     'eig_vals.dat' u 1:($2 == 0.01 && $3 == 0.001    ? abs($4) / sqrt($3):1/0) ps 2 title '0.001'   ,\
     [1:35] 0.6 * x**0.5 lc -1 lw 3,\
     [35:1000] 3.5 lc -1 lw 3
unset multiplot