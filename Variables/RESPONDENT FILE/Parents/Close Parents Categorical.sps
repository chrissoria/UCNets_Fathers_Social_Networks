* Encoding: UTF-8.
comment close father and mother nominal variable.

DO IF (RCLOSE_FATHER = 1).
COMPUTE RCLOSE_FATHER_CAT = 2. 
ELSE IF (RCLOSE_FATHER = 0 AND RFATHERNAMED = 1).
COMPUTE RCLOSE_FATHER_CAT = 1.
ELSE IF (RFATHERNAMED = 0).
COMPUTE RCLOSE_FATHER_CAT = 0. 
END IF.

VALUE LABELS RCLOSE_FATHER_CAT 2'Close Father ro step Named' 1'A father or step named but not close' 0'no father named'.

FREQUENCIES RCLOSE_FATHER_CAT.

comment close father reversed with highest category a non-close father.

RECODE RCLOSE_FATHER_CAT (2=1) (1=2) (0=0) INTO RCLOSE_FATHER_REVERSED.

VALUE LABELS RCLOSE_FATHER_REVERSED 2'Father/stepfather named but not close' 1'Father/step named and close' 0'father not named'.

FREQUENCIES RCLOSE_FATHER_REVERSED.


DO IF (RCLOSE_MOTHER = 1).
COMPUTE RCLOSE_MOTHER_CAT = 2. 
ELSE IF (RCLOSE_MOTHER = 0 AND RMOTHERNAMED = 1).
COMPUTE RCLOSE_MOTHER_CAT = 1.
ELSE IF (RMOTHERNAMED = 0).
COMPUTE RCLOSE_MOTHER_CAT = 0. 
END IF.

VALUE LABELS RCLOSE_MOTHER_CAT 2'Close MOTHER ro step Named' 1'A MOTHER or step named but not close' 0'no MOTHER named'.

FREQUENCIES RCLOSE_MOTHER_CAT.

comment close mother with highest ctegoy a non-close mother. 

RECODE RCLOSE_MOTHER_CAT (2=1) (1=2) (0=0) INTO RCLOSE_MOTHER_REVERSED.

VALUE LABELS RCLOSE_MOTHER_REVERSED 2'Mother/stepmother named but not close' 1'Mother/step named and close' 0'mother not named'.

FREQUENCIES RCLOSE_MOTHER_REVERSED.

