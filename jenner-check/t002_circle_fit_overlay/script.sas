/* Adapted from utl-altair-slc-AI-computer-vision-fitting-a-circle-to-a-scatter-plot-of-points-r.sas
   (rogerjdeangelis) - the circle-overlay step that consumes a fitted circle
   (radius, x_origin, y_origin) and re-projects it onto the scatter as ycir.
   Original derived radius/x_origin/y_origin via PROC R calling conicfit's
   CircleFitByLandau(); Jenner has no R bridge, so this bundle regenerates
   workx.have with the same streaminit(1) seed as the source script and feeds
   the DATA step the radius/x_origin/y_origin values the author's own log
   shows CircleFitByLandau returned for that exact data (203.038 / -1.711 /
   0.000). The formula, macro variables, and PROC PLOT statement are
   otherwise byte-identical to the source. */

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

/* mock: radius/x_origin/y_origin as captured from the author's own
   CircleFitByLandau(xy) run against this exact data (see source README) */
data workx.want;
   radius   = 203.038;
   x_origin = -1.711;
   y_origin =  0.000;
run;

data _null_;
   set workx.want;
   call symputx("radius",put(radius,9.3));
   call symputx("x_origin",put(x_origin,9.3));
   call symputx("y_origin",put(y_origin,9.3));
 run;quit;

%put &=radius;
%put &=x_origin;
%put &=y_origin;

%put formula = sqrt(&radius**2 - (x - (&x_origin.))**2) + &y_origin.;
data want;
   set workx.have;
   ycir=sqrt(&radius**2 - (x - &x_origin.)**2) + &y_origin.;
   output;
   ycir=-ycir;
   output;
run;quit;

options ls=64 ps=44;
proc plot data=want;
  plot ycir*x="+" / box
 href=0 vref=0 haxis=-200 to 200 by 100 vaxis=-200 to 200 by 100;;
run;quit;
