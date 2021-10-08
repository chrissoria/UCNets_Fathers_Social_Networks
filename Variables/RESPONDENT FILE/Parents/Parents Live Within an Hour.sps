* Encoding: UTF-8.
comment mother variable.

Recode a8a_2 (1,3 = 1) (2 = 0) INTO PARENTS_LIVE_WITHIN_HOUR. 
FREQUENCIES PARENTs_LIVE_WITHIN_HOUR. 

RECODE PARENTS_LIVE_WITHIN_HOUR (SYSMIS = 0).

RECODE a8d (1,3 = 1) (2 = 0) INTO MomWithinHour. 
FREQUENCIES MomWithinHour. 

RECODE MomWithinHour (SYSMIS = 0).


DO IF (PARENTS_LIVE_WITHIN_HOUR = 1 OR MomWithinHour = 1).
COMPUTE RMOTHER_WITHIN_HOUR = 1.
ELSE.
COMPUTE RMOTHER_WITHIN_HOUR = 0.
END IF.

VALUE LABELS RMOTHER_WITHIN_HOUR 1'Mother lives within an hour' 0'mom does not live within an hour'.

FREQUENCIES RMOTHER_WITHIN_HOUR. 

comment father variable. 

Recode a8f (1,3 = 1) (2 = 0) INTO DadWithinHour. 

RECODE DadWithinHour (SYSMIS = 0).

FREQUENCIES DadWithinHour.


DO IF (PARENTS_LIVE_WITHIN_HOUR = 1 OR DadWithinHour = 1).
COMPUTE RFATHER_WITHIN_HOUR = 1.
ELSE.
COMPUTE RFATHER_WITHIN_HOUR = 0.
END IF.

VALUE LABELS RFATHER_WITHIN_HOUR 1'Father lives within an hour' 0'dad does not live within an hour'.

FREQUENCIES RFATHER_WITHIN_HOUR. 

DO IF (RFATHER_WITHIN_HOUR = 1 AND RMOTHER_WITHIN_HOUR = 1).
COMPUTE RPARENT_WITHIN_HOUR = 3.
ELSE IF (RFATHER_WITHIN_HOUR = 1).
COMPUTE RPARENT_WITHIN_HOUR = 2.
ELSE IF (RMOTHER_WITHIN_HOUR = 1).
COMPUTE RPARENT_WITHIN_HOUR = 1.
ELSE.
COMPUTE RPARENT_WITHIN_HOUR = 0. 
END IF.

VALUE LABELS RPARENT_WITHIN_HOUR 3'Both mother and father live within an hour' 2'only father lives within an hour' 1'only mother lives within an hour' 0'neither father nor mother'.

FREQUENCIES RParent_WITHIN_HOUR.

TEMPORARY.
SELECT IF RMOTHER_WITHIN_HOUR = 0.
FREQUENCIES RFATHER_WITHIN_HOUR.
