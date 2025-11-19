%let pgm=utl-altair-slc-AI-computer-vision-fitting-a-circle-to-a-scatter-plot-of-points-r;

%stop_submission;

Altair slc AI computer vision fitting a circle to a scatter plot of points wps r

Too long to post in a listderv, gee github

gihub
https://github.com/rogerjdeangelis/utl-altair-slc-AI-computer-vision-fitting-a-circle-to-a-scatter-plot-of-points-r

Very simple example of fitting a circle or elipse to messy scatter plot.
Consider it the outline of a poor face, image in pixels.

see this pacakge can (do much more than fit  circle - elipse fits);
Good to estimate the contours os a face.
https://cran.r-project.org/web/packages/conicfit/conicfit.pdf

Other AI Repos

-------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/utl-AI-compute-the-distance-between-objects-in-an-image-python
https://github.com/rogerjdeangelis/utl-AI-computer-vision-fitting-a-circle-to-a-scatter-plot-of-points-wps-r
https://github.com/rogerjdeangelis/utl-AI-first-name-and-birth-date-range-to-gender
https://github.com/rogerjdeangelis/utl-AI-geometry-is-the-figure-a-right-triangle-
https://github.com/rogerjdeangelis/utl-AI-internal-angles-of-polygon-from-vertex-coordinates-in-r
https://github.com/rogerjdeangelis/utl-AI-labeling-centroids-inside-and-within-a-boundary-polygon
https://github.com/rogerjdeangelis/utl-AI-remove-noise-from-an-image-python-opencv
https://github.com/rogerjdeangelis/utl-AI-spelling-corrector-when-word-is-close-to-the-correct-word
https://github.com/rogerjdeangelis/utl-R-AI-igraph-list-connections-in-a-non-directed-graph-for-a-subset-of-vertices
https://github.com/rogerjdeangelis/utl-capturing-old-faithful-before-and-during-an-eruption--AI-visual-analytics
https://github.com/rogerjdeangelis/utl-determinating-gender-from-firstname-AI-sas-r-and-python
https://github.com/rogerjdeangelis/utl-finding-the-syllables-of-words-AI-NLP
https://github.com/rogerjdeangelis/utl-formatting-ai-seacrh-output-in-pdf-rtf-and-excel-format-perplexity-chatGPT-results
https://github.com/rogerjdeangelis/utl-python-AI-color-frequencies-in-an-image
https://github.com/rogerjdeangelis/utl-r-compute-the-area--of-an-image-which-is-under-a-curve-AI-image-processing-AI
https://github.com/rogerjdeangelis/utl-r-python-compute-the-area-between-two-curves-AI-sympy-trapezoid
https://github.com/rogerjdeangelis/utl-scraping-AI-results-without-restriction-or-API-with-powershell-and-perplexity
https://github.com/rogerjdeangelis/utl-simple-three-letter-commands-to-format-perplexity-AI-results-for-word-pdf-text-and-excel

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                       INPUT                                                                                            */
/*                                                        PROCESS                           OUTPUT                        */
/*                                                                                                                        */
/*      -200     -100       0       100      200                                -200     -100       0       100      200  */
/*      --+--------+--------+--------+--------+--   want <-                     --+--------+--------+--------+--------+-- */
/*   Y |                                        |    CircleFitByLandau(xy);    |                                        | */
/*     |                                        |                              |      RADIUS     X-ORIGIN    Y-ORIGIN   | */
/*     |                                        |                              | sqrt(203.038**2-(X-1.711)**2) + 0      | */
/*     |         *         |   * *  *           |       RADIUS   = 203.038     |                                        | */
/*     |          **    ** | *       *          |       X_ORIGIN = -1.711      |                                        | */
/* 200 +   *  **          ** **   *             + 200   Y_ORIGIN = 0.000     200 +            ++++++++++++++            + */
/*     |     *      *** *  |    *  ***       *  |                              |         +++       |       ++           | */
/*     |       *     *   * |    *   **   *      |                              |       ++          |         ++         | */
/*     |        ** *  *    | *  **              |                              |     ++            |            ++      | */
/*     |    ** *  **     * | *    *     ** **   |                              |    ++             |             ++     | */
/* 100 +   *  * *          |          *   *     + 100                      100 +   ++              |               +    + */
/*     |   *               |                    |                              |  ++               |                +   | */
/*     | **                |                 *  |                              |  +                |                    | */
/*     |                   |            * *     |                              | +                 |                 +  | */
/*     |                   |                *   |                              |                   |                 +  | */
/*   0 +-------------------+------------------- + 0                          0 +-------------------+------------------- + */
/*     |                   |                *   |                              |                   |                 +  | */
/*     |                   |            * *     |                              | +                 |                 +  | */
/*     | **                |                 *  |                              |  +                |                    | */
/*     |   *               |                    |                              |                   |                +   | */
/* 100 +   *  * *          |          *   *     + 100                      100 +   +               |               +    + */
/*     |    ** *  **     * | *    *     ** **   |                              |    +              |             ++     | */
/*     |        ** *  *    | *  **              |                              |     ++            |            ++      | */
/*     |       *     *   * |    *   **   *      |                              |       ++          |         ++         | */
/*     |     *      *** *  |    *  ***       *  |                              |         ++++      |     ++++           | */
/* 200 +   *  **          ** **   *             + 200                      200 +            ++++++++++++++              + */
/*     |          **    ** | *       *          |                              |                   |                    | */
/*       --+--------+--------+--------+--------+-                               --+--------+--------+--------+--------+-- */
/*      -200     -100      0         100      200                               -200     -100       0       100      200  */
/*                                                                                                                        */
/*                                                                                                                        */
/*  SD1.HAVE total obs=158                                                                                                */
/*                                                                                                                        */
/*  Obs        x           y                                                                                              */
/*                                                                                                                        */
/*    1    -199.802      59.505                                                                                           */
/*    2    -199.802     -59.505                                                                                           */
/*    3    -193.496      68.193                                                                                           */
/*    4    -193.496     -68.193                                                                                           */
/*    5    -182.174      81.413                                                                                           */
/*                                                                                                                        */
/*  153     199.390      66.369                                                                                           */
/*  154     199.390     -66.369                                                                                           */
/*  155     175.020     113.711                                                                                           */
/*  156     175.020    -113.711                                                                                           */
/*  157     196.251     188.399                                                                                           */
/*  158     196.251    -188.399                                                                                           */
/*                                                                                                                        */
/***********************************************************************************************************************  */

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

libname workx "d:/wpswrkx";

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

/**************************************************************************************************************************/
/*                                                                                                                        */
/* SD1.HAVE total obs=158                                                                                                 */
/*                                                                                                                        */
/* Obs        x           y                                                                                               */
/*                                                                                                                        */
/*   1    -199.802      59.505                                                                                            */
/*   2    -199.802     -59.505                                                                                            */
/*   3    -193.496      68.193                                                                                            */
/*   4    -193.496     -68.193                                                                                            */
/*   5    -182.174      81.413                                                                                            */
/*                                                                                                                        */
/* 153     199.390      66.369                                                                                            */
/* 154     199.390     -66.369                                                                                            */
/* 155     175.020     113.711                                                                                            */
/* 156     175.020    -113.711                                                                                            */
/* 157     196.251     188.399                                                                                            */
/* 158     196.251    -188.399                                                                                            */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1         libname workx "d:/wpswrkx";
NOTE: Library workx assigned as follows:
      Engine:        WPD
      Physical Name: d:\wpswrkx


                                         The WPS System      14:21 Wednesday, June  1, 2022    1

                                     The DATASETS Procedure

                                           Directory

                                  Libref           WORKX
                                  Engine           WPD
                                  Physical Name    d:\wpswrkx

                                            Members

                            Member    Member
                  Number    Name      Type         File Size      Date Last Modified
            ________________________________________________________________________
                       1    HAVE      DATA              8192      01JUN2022:13:57:49
                       2    WANT      DATA              8192      01JUN2022:14:06:42
2
3         proc datasets lib=workx kill nodetails;
4         run;quit;
NOTE: Deleting WORKX.HAVE (type=DATA)
NOTE: Deleting WORKX.WANT (type=DATA)
NOTE: Procedure datasets step took :
      real time : 0.015
      cpu time  : 0.000


5
6         options validvarname=upcase;
7         data workx.have(keep=x y);
8          call streaminit(1);
9          do xs= -200 to 200 by 5;
10           x=xs + rand("normal",0,10);
11           y=sqrt(40000 - x**2) + rand("normal",0,50);
12           if y ne . then do;
13              output;
14              y=-y;
15              output;
16           end;
17         end;
18        run;

NOTE: Argument to function SQRT at line 11 column 6 is invalid
NOTE: Argument to function SQRT at line 11 column 6 is invalid
_N_=1 _ERROR_=1 XS=205 X=214.20125608 Y=.
NOTE: Mathematical operations could not be performed at the following places. The results of the
      operations have been set to missing values.
      Each place is given by: (Number of times) at (Line):(Column)
      2 at 11:6
NOTE: Missing values resulted from performing arithmetic upon missing values.
      Each place is given by: (Number of times) at (Line):(Column)
      2 at 11:25
NOTE: Data set "WORKX.have" has 158 observation(s) and 2 variable(s)
NOTE: The data step took :
      real time : 0.007
      cpu time  : 0.000


18      !     quit;

2                        The WPS System
                                  14:21 Wednesday, June  1, 2022

19
20        options ls=64 ps=54;
21        proc plot data=workx.have;
22          plot y*x="*"/ box
23            href=0 vref=0 haxis=-200 to 200 by 100 vaxis=-200
23      ! to 200 by 100;
24        run;quit;
NOTE: 44 observation(s) outside the axis range for the Plot of
      Y*X. Symbol used is '*'. request
NOTE: Procedure plot step took :
      real time : 0.015
      cpu time  : 0.000



NOTE: Submitted statements took :
      real time : 0.074
      cpu time  : 0.000

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/


libname workx "d:/wpswrkx";
options ls=171 ps=65;
proc r;
export data=workx.have r=have;
submit;
library(conicfit)
xy  <- as.matrix(have);
want <- as.data.frame(CircleFitByLandau(xy))
colnames(want)<-c("x_origin","y_origin","radius")
want
endsubmit;
import r=want data=workx.want;
run;quit;

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
');

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*      ciccle(x) = sqrt(203.038**2 - (x - (-1.711))**2)                                                           */
/*                                                                                                                        */
/*      radius    = 203.038                                                                                               */
/*      x_origin  = -1.711                                                                                                */
/*      y_origin  = 0.000                                                                                                 */
/*                                                                                                                        */
/*                               X                                                                                        */
/*      -200         -100           0           100          200                                                          */
/*       -+------------+------------+------------+------------+-                                                          */
/*  YCIR |                          |                          | YCIR                                                     */
/*       |                          |                          |                                                          */
/*   200 +                 +++ + +++++ ++++++                  +  200                                                     */
/*       |              ++++        |        + +++             |                                                          */
/*       |         ++++             |            +++           |                                                          */
/*       |       +++                |                  +       |                                                          */
/*       |     ++                   |                  +++     |                                                          */
/*       |    +                     |                    +     |                                                          */
/*   100 +  +                       |                      +   +  100                                                     */
/*       |                          |                       +  |                                                          */
/*       | +                        |                          |                                                          */
/*       |+                         |                         +|                                                          */
/*       |                          |                         +|                                                          */
/*       |                          |                          |                                                          */
/*     0 +--------------------------+--------------------------+  0                                                       */
/*       |                          |                          |                                                          */
/*       |                          |                         +|                                                          */
/*       |+                         |                         +|                                                          */
/*       | +                        |                          |                                                          */
/*       |                          |                       +  |                                                          */
/*  -100 +  +                       |                      +   + -100                                                     */
/*       |    +                     |                    +     |                                                          */
/*       |     ++                   |                  +++     |                                                          */
/*       |       +++                |                  +       |                                                          */
/*       |         ++++             |            +++           |                                                          */
/*       |              ++++        |        + +++             |                                                          */
/*  -200 +                 +++ + +++++ ++++++                  + -200                                                     */
/*       -+------------+------------+------------+------------+-                                                          */
/*      -200         -100           0           100          200                                                          */
/*                                                                                                                        */
/*                                  X                                                                                     */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1         libname workx "d:/wpswrkx";
NOTE: Library workx assigned as follows:
      Engine:        WPD
      Physical Name: d:\wpswrkx

2         options ls=171 ps=65;
3         proc r;
NOTE: Using R version 4.3.2 (2023-10-31 ucrt) from C:\Program Files\R\R-4.3.2
4         export data=workx.have r=have;
NOTE: Creating R data frame 'have' from data set 'WORKX.have'

5         submit;
6         library(conicfit)
7         xy  <- as.matrix(have);
8         want <- as.data.frame(CircleFitByLandau(xy))
9         colnames(want)<-c("x_origin","y_origin","radius")
10        want
11        endsubmit;

NOTE: Submitting statements to R:

> library(conicfit)
Loading required package: pracma
Loading required package: geigen
Warning message:
package 'conicfit' was built under R version 4.3.3
> xy  <- as.matrix(have);
> want <- as.data.frame(CircleFitByLandau(xy))
> colnames(want)<-c("x_origin","y_origin","radius")
> want

NOTE: Processing of R statements complete

12        import r=want data=workx.want;
NOTE: Creating data set 'WORKX.want' from R data frame 'want'
NOTE: Data set "WORKX.want" has 1 observation(s) and 3 variable(s)

13        run;quit;
NOTE: Procedure r step took :
      real time : 0.260
      cpu time  : 0.000


14
15        data _null_;
16           set workx.want;
17           call symputx("radius",put(radius,9.3));
18           call symputx("x_origin",put(x_origin,9.3));
19           call symputx("y_origin",put(y_origin,9.3));
20         run;

NOTE: 1 observations were read from "WORKX.want"
NOTE: The data step took :
      real time : 0.035
      cpu time  : 0.000

20      !      quit;
21
22        %put &=radius;
radius=203.038
23        %put &=x_origin;
x_origin=-1.711
24        %put &=y_origin;
y_origin=0.000
25
26        %put formula = sqrt(&radius**2 - (x - (&x_origin.))**2) + &y_origin.;
formula = sqrt(203.038**2 - (x - (-1.711))**2) + 0.000
27        data want;
28           set workx.have;
29           ycir=sqrt(&radius**2 - (x - &x_origin.)**2) + &y_origin.;
30           output;
31           ycir=-ycir;
32           output;
33        run;

NOTE: 158 observations were read from "WORKX.have"
NOTE: Data set "WORK.want" has 316 observation(s) and 3 variable(s)
NOTE: The data step took :
      real time : 0.005
      cpu time  : 0.000


33      !     quit;
34
35        options ls=64 ps=44;
36        proc plot data=want;
37          plot ycir*x="+" / box
38         href=0 vref=0 haxis=-200 to 200 by 100 vaxis=-200 to
38      ! 200 by 100;;
39        run;quit;
NOTE: 60 observation(s) outside the axis range for the Plot of
      ycir*X. Symbol used is '+'. request
NOTE: Procedure plot step took :
      real time : 0.011
      cpu time  : 0.000

NOTE: Submitted statements took :
      real time : 0.347
      cpu time  : 0.000

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
