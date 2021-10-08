﻿* Encoding: UTF-8.

comment there were some missing values, these values represent people who did not name a tie within a certain category.

Comment in order to include people who did not name certain kinds of ties, I coded missing ties as 0.

FREQUENCIES SOCIAL_BEYOND_PARENTS.
RECODE SOCIAL_BEYOND_PARENTS (SYSMIS = 0).
FREQUENCIES SOCIAL_BEYOND_PARENTS.

FREQUENCIES CONFIDE_BEYOND_PARENTS.
RECODE CONFIDE_BEYOND_PARENTS (SYSMIS = 0). 
FREQUENCIES CONFIDE_BEYOND_PARENTS.

FREQUENCIES ADVICE_BEYOND_PARENTS.
RECODE ADVICE_BEYOND_PARENTS (SYSMIS = 0).
FREQUENCIES ADVICE_BEYOND_PARENTS.

FREQUENCIES CLOSE_BEYOND_PARENTS.
RECODE CLOSE_BEYOND_PARENTS (SYSMIS = 0). 
FREQUENCIES CLOSE_BEYOND_PARENTS.

comment male only ties.

FREQUENCIES MALE_SOCIAL_BEYOND_PARENTS.
RECODE MALE_SOCIAL_BEYOND_PARENTS (SYSMIS = 0).
FREQUENCIES MALE_SOCIAL_BEYOND_PARENTS.

FREQUENCIES MALE_CONFIDE_BEYOND_PARENTS.
RECODE MALE_CONFIDE_BEYOND_PARENTS (SYSMIS = 0). 
FREQUENCIES MALE_CONFIDE_BEYOND_PARENTS.

FREQUENCIES MALE_ADVICE_BEYOND_PARENTS.
RECODE MALE_ADVICE_BEYOND_PARENTS (SYSMIS = 0).
FREQUENCIES MALE_ADVICE_BEYOND_PARENTS.

FREQUENCIES MALE_CLOSE_BEYOND_PARENTS.
RECODE MALE_CLOSE_BEYOND_PARENTS (SYSMIS = 0). 
FREQUENCIES MALE_CLOSE_BEYOND_PARENTS.

comment female only ties.

FREQUENCIES FEMALE_SOCIAL_BEYOND_PARENTS.
RECODE FEMALE_SOCIAL_BEYOND_PARENTS (SYSMIS = 0).
FREQUENCIES FEMALE_SOCIAL_BEYOND_PARENTS.

FREQUENCIES FEMALE_CONFIDE_BEYOND_PARENTS.
RECODE FEMALE_CONFIDE_BEYOND_PARENTS (SYSMIS = 0). 
FREQUENCIES FEMALE_CONFIDE_BEYOND_PARENTS.

FREQUENCIES FEMALE_ADVICE_BEYOND_PARENTS.
RECODE FEMALE_ADVICE_BEYOND_PARENTS (SYSMIS = 0).
FREQUENCIES FEMALE_ADVICE_BEYOND_PARENTS.

FREQUENCIES FEMALE_CLOSE_BEYOND_PARENTS.
RECODE FEMALE_CLOSE_BEYOND_PARENTS (SYSMIS = 0). 
FREQUENCIES FEMALE_CLOSE_BEYOND_PARENTS.

