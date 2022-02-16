﻿* Encoding: UTF-8.
comment all social ties.

TEMPORARY.
SELECT IF (RFATHER_ALIVE = 1 OR RFATHERNAMED = 1) AND (RMOTHER_ALIVE = 1 OR RMOTHERNAMED = 1).
WEIGHT BY WT_W1_DEM_95_INF.
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING PAIRWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT SOCIAL_BEYOND_PARENTS
 /METHOD=ENTER RCLOSE_FATHER RFATHERNAMED RCLOSE_MOTHER RMOTHERNAMED
GENDER RPARENT_WITHIN_HOUR_DUMMY RPERSONAL_INCOME FB_FLAG EDUCATION RMARRIED RNEW_BABY RNEW_JOB AGEGROUP SELECTED_MODE RPDIV
Black Asian Hispanic
   /SCATTERPLOT=(*ZRESID ,*ZPRED)
  /RESIDUALS NORMPROB(ZRESID).

comment male only social ties. 


TEMPORARY.
SELECT IF (RFATHER_ALIVE = 1 OR RFATHERNAMED = 1) AND (RMOTHER_ALIVE = 1 OR RMOTHERNAMED = 1).
WEIGHT BY WT_W1_DEM_95_INF.
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING PAIRWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT MALE_SOCIAL_BEYOND_PARENTS
 /METHOD=ENTER RCLOSE_FATHER RFATHERNAMED RCLOSE_MOTHER RMOTHERNAMED
GENDER RPARENT_WITHIN_HOUR_DUMMY RPERSONAL_INCOME FB_FLAG EDUCATION RMARRIED RNEW_BABY RNEW_JOB AGEGROUP SELECTED_MODE RPDIV
Black Asian Hispanic
   /SCATTERPLOT=(*ZRESID ,*ZPRED)
  /RESIDUALS NORMPROB(ZRESID).

comment female only social ties. 

TEMPORARY.
SELECT IF (RFATHER_ALIVE = 1 OR RFATHERNAMED = 1) AND (RMOTHER_ALIVE = 1 OR RMOTHERNAMED = 1).
WEIGHT BY WT_W1_DEM_95_INF.
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING PAIRWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT FEMALE_SOCIAL_BEYOND_PARENTS
 /METHOD=ENTER RCLOSE_FATHER RFATHERNAMED RCLOSE_MOTHER RMOTHERNAMED
GENDER RPARENT_WITHIN_HOUR_DUMMY RPERSONAL_INCOME FB_FLAG EDUCATION RMARRIED RNEW_BABY RNEW_JOB AGEGROUP SELECTED_MODE RPDIV
Black Asian Hispanic
   /SCATTERPLOT=(*ZRESID ,*ZPRED)
  /RESIDUALS NORMPROB(ZRESID).