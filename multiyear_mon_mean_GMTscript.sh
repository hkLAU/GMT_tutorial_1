#!/bin/bash
#--------------------------------
# script by Katie Hong Kiu Lau, March 2022. Contact email: hklau@mun.ca 
# to run this script , type sh climatological_mean_GMTscript.sh in terminal 
#--------------------------------
#setup: this can be change according to your need


gmt gmtset GMT_VERBOSE normal
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset MAP_FRAME_PEN 0.5p,0
gmt gmtset PS_MEDIA a1
gmt gmtset FONT_ANNOT_PRIMARY 10p,Helvetica,black
gmt gmtset FONT_LABEL 12p,Helvetica,black
gmt gmtset PS_PAGE_COLOR white
gmt gmtset FORMAT_FLOAT_MAP %lg
#--------------------------------------------------------
# inputs 
dir=~/Documents/your_data_folder
input1=$dir/input1.nc
input2=$dir/input2.nc
input3=$dir/input3.nc
input4=$dir/input4.nc
input5=$dir/input5.nc
input6=$dir/input6.nc
input7=$dir/input7.nc
input8=$dir/input8.nc
input9=$dir/input9.nc
input10=$dir/input10.nc
input11=$dir/input11.nc
input12=$dir/input12.nc

# Set zero values into missing values if needed
#gmt grdmath $input?variable[0] 0 NAN = $input1.nc

#output (.ps = postscript)
output=$dir/output.ps

#--------------------------------------------------------
# other vector downloaded from naturalearth 
naturalearth=~/Documents/naturalearth
coast=$naturalearth/ne_110m_coastline.gmt
#--------------------------------------------------------
# set cpt (color scale) can be download from cptcity 
cpt=$dir/cpt_ymm.cpt
#--------------------------------------------------------
# set output resolution (usually 300)
imageres=300
#--------------------------------------------------------
# set bounds (-R) & projection (-J)
bounds=-169/191/-60/90
projpres=-JQ10
#-------------------------------------------------------

# mapping
# plot 1
gmt psbasemap -R$bounds $projpres -B0 -P -X2 -Y50 -K > $output

gmt grdimage $input1 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Jan" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.2 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 2
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input2 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Feb" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.2 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 3
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input3 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Mar" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.2 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 4
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input4 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output
echo "Apr" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.2 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 5
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input5 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "May" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.1 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 6
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input6 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Jun" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.1 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 7
gmt psbasemap -R$bounds $projpres -B0 -P -X10.3 -Y22.5 -K -O >> $output

gmt grdimage $input7 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Jul" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.1 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 8
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input8 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Aug" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.1 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 9
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input9 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Sep" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.1 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 10
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input10 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Oct" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.1 -Gwhite -O -P -K >> $output
#--------------------------------------------------------
# plot 11
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input11 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Nov" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.1 -Gwhite -O -P -K >> $output

#--------------------------------------------------------
# plot 12
gmt psbasemap -R$bounds $projpres -B0 -P -X0 -Y-4.5 -K -O >> $output

gmt grdimage $input12 -E$imageres -nl -R -J -C$cpt -O -K -P >> $output  

gmt psxy $coast -R -J -Wthinnest,black -O -P -K >> $output

gmt psbasemap -R -J -B0 -O -P -K >> $output

echo "Dec" |gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.1 -Gwhite -O -P -K >> $output

gmt psscale -C$cpt -Dx-4.5/-1+w8.5/0.3+h+ef0.5 -L -S -B+l"Title (Strokes km@+-2@+ m@+-1@+)" -Np -O -P >> $output


echo generating pdf

gmt psconvert -A -Tf -Z $output
