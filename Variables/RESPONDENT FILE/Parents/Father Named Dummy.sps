* Encoding: UTF-8.
FREQUENCIES RFATHER_ALIVE.

RECODE RFATHER_ALIVE (1=1) (8,2=0) INTO RFATHER_ALIVE_DUMMY. 

VALUE LABELS RFATHER_ALIVE_DUMMY 1'Respondent father knowb to be alive' 0'father is not alive, or respondent doesnt know'.

FREQUENCIES RFATHER_ALIVE_DUMMY.


FREQUENCIES RMOTHER_ALIVE.

RECODE RMOTHER_ALIVE (1=1) (8,2=0) INTO RMOTHER_ALIVE_DUMMY. 

VALUE LABELS RMOTHER_ALIVE_DUMMY 1'Respondent father knowb to be alive' 0'father is not alive, or respondent doesnt know'.

FREQUENCIES RMOTHER_ALIVE_DUMMY.


TEMPORARY.
SELECT IF RFATHER_ALIVE_DUMMY = 0.
FREQUENCIES RFATHERNAMED.

TEMPORARY.
SELECT IF RMOTHER_ALIVE_DUMMY = 0.
FREQUENCIES RMOTHERNAMED.

TEMPORARY.
SELECT IF RFATHER_ALIVE_DUMMY = 1.
FREQUENCIES RFATHERNAMED.

TEMPORARY.
SELECT IF RMOTHER_ALIVE_DUMMY = 1.
FREQUENCIES RMOTHERNAMED.

FACTOR
  /VARIABLES RFATHERNAMED RFATHER_ALIVE_DUMMY
  /MISSING LISTWISE 
  /ANALYSIS RFATHERNAMED RFATHER_ALIVE_DUMMY
  /PRINT INITIAL CORRELATION SIG DET KMO EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.
