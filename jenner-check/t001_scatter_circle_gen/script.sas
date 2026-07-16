/* Adapted from utl-altair-slc-AI-computer-vision-fitting-a-circle-to-a-scatter-plot-of-points-r.sas
   (rogerjdeangelis) - the scatter-generation + PROC PLOT step.
   Original used libname workx "d:/wpswrkx" (Windows path); redirected to WORK
   below since Jenner has no local disk to point a libname at. Logic, options,
   and PROC PLOT statement are otherwise byte-identical to the source. */

libname workx (work);

proc datasets lib=workx kill nodetails;
run;quit;

options validvarname=upcase;
data workx.have(keep=x y);
 call streaminit(1);
 do xs= -200 to 200 by 5;
   x=xs + rand("normal",0,10);
   y=sqrt(40000 - x**2) + rand("normal",0,50);
   if y ne . then do;
      output;
      y=-y;
      output;
   end;
 end;
run;quit;

options ls=64 ps=54;
proc plot data=workx.have;
  plot y*x="*"/ box
    href=0 vref=0 haxis=-200 to 200 by 100 vaxis=-200 to 200 by 100;
run;quit;
