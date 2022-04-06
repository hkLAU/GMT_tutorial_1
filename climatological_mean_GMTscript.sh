#!/bin/bash
#--------------------------------
# script by Katie Hong Kiu Lau, March 2022. Contact email: hklau@mun.ca 
# to run this script , type sh climatological_mean_GMTscript.sh in terminal 
#--------------------------------
#setup: this can be change according to your need

gmt gmtset GMT_VERBOSE normal 
gmt gmtset FORMAT_FLOAT_MAP %lg
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset MAP_FRAME_PEN 0.5p,0
gmt gmtset PS_PAGE_COLOR white
gmt gmtset PS_MEDIA a1
gmt gmtset FONT_ANNOT_PRIMARY 12p,Helvetica,black 
gmt gmtset FONT_LABEL 14p,Helvetica,black

#--------------------------------------------------------
# input 
dir=~/Documents/your_data_folder
input=$dir/input.nc

#output (.ps = postscript)
output=$dir/output.ps

#--------------------------------------------------------
# other vector downloaded from naturalearth 
naturalearth=~/Documents/naturalearth
coast=$naturalearth/ne_110m_coastline.gmt
#--------------------------------------------------------
# set cpt (color scale) can be download from cptcity 
cpt=$dir/cpt.cpt
#--------------------------------------------------------
# set output resolution (usually 300)
imageres=300
#--------------------------------------------------------
# set bounds (-R) & projection (-J)
bounds=-169/191/-60/90
projpres=-JQ30
#-------------------------------------------------------

# mapping 

#! first line no -O and > is single 
psbasemap -R$bounds $projpres -B0 -K -P > $output   # make basemap 

grdimage $input -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  # plot netcdf 

psxy $coast -R -J -W0.5p,black -O -P -K >> $output # plot vector

psbasemap -R -J -B0 -O -P -K >> $output 

#! last line no -K 
psscale -C$cpt -D6/-1.5+w18/0.3+h+ef1 -L -S -B+l"Title & unit" -O -P >> $output  # plot scale bar


echo generating pdf

psconvert -A -Tf -Z $output
