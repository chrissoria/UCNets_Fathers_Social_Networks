﻿* Encoding: UTF-8.
 
  UNIANOVA ADVICE_BEYOND_PARENTS BY RCLOSE_FATHER_REVERSED RCLOSE_MOTHER_REVERSED
   WITH GENDER k5 RFATHER_ALIVE RMOTHER_ALIVE RPERSONAL_INCOME RFATHER_WITHIN_HOUR
   RMOTHER_WITHIN_HOUR HOW_LONG_IN_TOWN SEXUALITY
   age MARITAL_STATUS EDUCATION OVERALL_HEALTH k6s1 k6s2 k6s3 k6s4 k6s5 k6s6 fb_flag
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(RCLOSE_FATHER_REVERSED, RCLOSE_MOTHER_REVERSED) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /PRINT PARAMETER
  /PRINT ETASQ DESCRIPTIVE PARAMETER
  /CRITERIA=ALPHA(.05)
  /DESIGN= RCLOSE_FATHER_REVERSED RCLOSE_MOTHER_REVERSED RFATHER_ALIVE RMOTHER_ALIVE
  RPERSONAL_INCOME RFATHER_WITHIN_HOUR RMOTHER_WITHIN_HOUR k5 SEXUALITY age 
  fb_flag MARITAL_STATUS HOW_LONG_IN_TOWN EDUCATION OVERALL_HEALTH k6s1 k6s2 k6s3 k6s4 k6s5 k6s6 GENDER.


  UNIANOVA MALE_ADVICE_BEYOND_PARENTS BY RCLOSE_FATHER_REVERSED RCLOSE_MOTHER_REVERSED
   WITH GENDER k5 RFATHER_ALIVE RMOTHER_ALIVE RPERSONAL_INCOME RFATHER_WITHIN_HOUR
   RMOTHER_WITHIN_HOUR HOW_LONG_IN_TOWN SEXUALITY
   age MARITAL_STATUS EDUCATION OVERALL_HEALTH k6s1 k6s2 k6s3 k6s4 k6s5 k6s6 fb_flag
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(RCLOSE_FATHER_REVERSED, RCLOSE_MOTHER_REVERSED) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /PRINT PARAMETER
  /PRINT ETASQ DESCRIPTIVE PARAMETER
  /CRITERIA=ALPHA(.05)
  /DESIGN= RCLOSE_FATHER_REVERSED RCLOSE_MOTHER_REVERSED RFATHER_ALIVE RMOTHER_ALIVE
  RPERSONAL_INCOME RFATHER_WITHIN_HOUR RMOTHER_WITHIN_HOUR k5 SEXUALITY age 
  fb_flag MARITAL_STATUS HOW_LONG_IN_TOWN EDUCATION OVERALL_HEALTH k6s1 k6s2 k6s3 k6s4 k6s5 k6s6 GENDER.

  UNIANOVA FEMALE_ADVICE_BEYOND_PARENTS BY RCLOSE_FATHER_REVERSED RCLOSE_MOTHER_REVERSED
   WITH GENDER k5 RFATHER_ALIVE RMOTHER_ALIVE RPERSONAL_INCOME RFATHER_WITHIN_HOUR
   RMOTHER_WITHIN_HOUR HOW_LONG_IN_TOWN SEXUALITY
   age MARITAL_STATUS EDUCATION OVERALL_HEALTH k6s1 k6s2 k6s3 k6s4 k6s5 k6s6 fb_flag
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(RCLOSE_FATHER_REVERSED, RCLOSE_MOTHER_REVERSED) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /PRINT PARAMETER
  /PRINT ETASQ DESCRIPTIVE PARAMETER
  /CRITERIA=ALPHA(.05)
  /DESIGN= RCLOSE_FATHER_REVERSED RCLOSE_MOTHER_REVERSED RFATHER_ALIVE RMOTHER_ALIVE
  RPERSONAL_INCOME RFATHER_WITHIN_HOUR RMOTHER_WITHIN_HOUR k5 SEXUALITY age 
  fb_flag MARITAL_STATUS HOW_LONG_IN_TOWN EDUCATION OVERALL_HEALTH k6s1 k6s2 k6s3 k6s4 k6s5 k6s6 GENDER.


