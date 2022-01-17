﻿* Encoding: UTF-8.
comment Parents alive.

RENAME VARIABLES (A7 = RFATHER_ALIVE) (A6 = RMOTHER_ALIVE).

FREQUENCIES RFATHER_ALIVE, RMOTHER_ALIVE.

comment income.

RENAME VARIABLES (K22A = RPERSONAL_INCOME). 

FREQUENCIES RPERSONAL_INCOME.

comment how long lived in town.

RENAME VARIABLES (a19b = HOW_LONG_IN_TOWN).

FREQUENCIES HOW_LONG_IN_TOWN.

comment marital status.

RENAME VARIABLES (a2a = MARITAL_STATUS).

FREQUENCIES MARITAL_STATUS.

RECODE MARITAL_STATUS (1=1) (2,3,4,5 = 0) INTO RMARRIED.

FREQUENCIES SELECTED_MODE.

RECODE SELECTED_MODE (3=0). 

VALUE LABELS SELECTED_MODE 0'Web' 1'face-to-face'.

VALUE LABELS RMARRIED 1'the respondent is married' 0'the respondent is not married'.

FREQUENCIES RMARRIED. 

COMMENT education.

RENAME VARIABLES (K1 = EDUCATION).

FREQUENCIES EDUCATION.

COMMENT health. 

RENAME VARIABLES (G1 = OVERALL_HEALTH).

FREQUENCIES OVERALL_HEALTH.

COMMENT sexuality. 

RENAME VARIABLES (H18 = SEXUALITY).

FREQUENCIES SEXUALITY.

COMMENT parents still together.

RENAME VARIABLES (A8A = RPARENTS_TOGETHER).

FREQUENCIES RPARENTS_TOGETHER.
