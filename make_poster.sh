#!/bin/bash

## Bash script to produce the poster

# Produce plot of initial configuration
# gnuplot init_config.p
# pdflatex init_config.tex

# Produce plot of unstable configuration
# gnuplot unstable_config.p
# pdflatex unstable_config.tex

# Produce plot of base states
# gnuplot base_state.p
# pdflatex base_state.tex

# Produce plot of Rayleigh-Taylor dispersion
gnuplot RT_dispersion.p
pdflatex RT_dispersion.tex

#Produce poster
pdflatex poster.tex
pdflatex poster.tex
