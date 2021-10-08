* Encoding: UTF-8.
FREQUENCIES k25.

DO IF (A25 < 2).
COMPUTE RNEW_JOB = 1.
ELSE IF (A25 > 1).
COMPUTE RNEW_JOB = 0.
END IF.

FREQUENCIES RNEW_JOB.

RECODE RNEW_JOB (SYSMIS = 0).

VALUE LABELS RNEW_JOB 1'Respondent reported being at a job for a year or less' 0'Respondent did not report being at a job for a year or less'.


