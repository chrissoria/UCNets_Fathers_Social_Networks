﻿* Encoding: UTF-8.
comment count of confiding ties.

FREQUENCIES b5a.

RECODE B4A (6,5,4,3,2,1 = 1) into B4A_YES.

FREQUENCIES B4A_Yes.

RECODE B4A_YES (SYSMIS = 0).

VALUE LABELS B4A_YES 1'confiding tie' 0'not confiding tie'.

comment breaking down confiding ties by gender.

DO IF N_GENDER = 1 AND B4A_YES =1.
COMPUTE MaleB4A = 1.
ELSE IF N_GENDER = 2 AND B4A_YES =1. 
COMPUTE MaleB4A = 2. 
END IF.

FREQUENCIES MaleB4A. 

VALUE LABELS MaleB4A 1'Male' 2'Female'.

comment separating out parents.

DO IF C1A_3 = 1 AND B4A_YES = 1.
COMPUTE B4A_PARENT = 1.
ELSE.
COMPUTE B4A_PARENT = 0.
END IF.

RECODE B4A_PARENT (SYSMIS = 0).

FREQUENCIES B4A_PARENT.

VALUE LABELS B4A_PARENT 0'Not Confiding Parent' 1'Confiding Parent'.

comment separating out mothers and fathers.

DO IF B4A_PARENT = 1 AND N_GENDER = 1.
COMPUTE B4A_FATHERS = 1. 
ELSE.
COMPUTE B4A_FATHERS = 0.
END IF.

FREQUENCIES B4A_FATHERS.

VALUE LABELS B4A_FATHERS 1'Confiding Fathers' 0'Not Confiding Fathers'.

DO IF B4A_PARENT = 1 AND N_GENDER = 2.
COMPUTE B4A_MOTHERS = 1. 
ELSE.
COMPUTE B4A_MOTHERS = 0.
END IF.

FREQUENCIES B4A_MOTHERS.

VALUE LABELS B4A_MOTHERS 1'Confiding Mothers' 0'Not Confiding Mothers'.

DO IF B4A_FATHERS = 1.
COMPUTE B4A_PARENTGENDER = 1.
ELSE IF B4A_MOTHERS = 1.
COMPUTE B4A_PARENTGENDER = 2.
END IF.

FREQUENCIES B4A_PARENTGENDER.

VALUE LABELS B4A_PARENTGENDER 1'Confiding Fathers' 2'Confiding Mothers'.

comment selecting for confiding ties beyond the parents.

DO IF B4A_PARENT = 0 AND B4A_YES = 1.
COMPUTE B4A_BEYONDPARENT =1. 
END IF.

FREQUENCIES B4A_BEYONDPARENT.

comment separating out step parents.

DO IF C1A_23 = 1 AND B4A_YES = 1.
COMPUTE B4A_STEPPARENT = 1.
ELSE.
COMPUTE B4A_STEPPARENT = 0.
END IF.

FREQUENCIES B4A_STEPPARENT.

RECODE B4A_STEPPARENT (SYSMIS = 0).

VALUE LABELS B4A_STEPPARENT 1'Confiding Step Parent' 0'Not a Confiding step parent'.

comment separating out step mother and step fathers.

DO IF B4A_STEPPARENT = 1 AND N_GENDER = 1.
COMPUTE B4A_STEPFATHERS = 1. 
ELSE.
COMPUTE B4A_STEPFATHERS = 0.
END IF.

FREQUENCIES B4A_STEPFATHERS.

VALUE LABELS B4A_STEPFATHERS 1'Confiding Step Fathers' 0'Not Confiding Step Fathers'.

DO IF B4A_STEPPARENT = 1 AND N_GENDER = 2.
COMPUTE B4A_STEPMOTHERS = 1. 
ELSE.
COMPUTE B4A_STEPMOTHERS = 0.
END IF.

FREQUENCIES B4A_STEPMOTHERS.

VALUE LABELS B4A_STEPMOTHERS 1'Confiding Step Mothers' 0'Not Confiding Step Mothers'.

DO IF B4A_STEPFATHERS = 1.
COMPUTE B4A_STEPPARENTGENDER = 1.
ELSE IF B4A_STEPMOTHERS = 1.
COMPUTE B4A_STEPPARENTGENDER = 2.
END IF.

FREQUENCIES B4A_STEPPARENTGENDER.

VALUE LABELS B4A_STEPPARENTGENDER 1'Confiding Step Fathers' 2'Confiding Step Mothers'.

comment selecting for confiding ties beyond the step parents.

DO IF B4A_STEPPARENT = 0 AND B4A_YES = 1.
COMPUTE B4A_BEYONDSTEPPARENT =1. 
END IF.

FREQUENCIES B4A_BEYONDSTEPPARENT.

comment combining step parents and parents.

DO IF B4A_PARENT = 1 OR B4A_STEPPARENT = 1.
COMPUTE B4A_ALLPARENTS = 1.
ELSE.
COMPUTE B4A_ALLPARENTS = 0. 
END IF. 

FREQUENCIES B4A_ALLPARENTS. 

VALUE LABELS B4A_ALLPARENTS 1'Confiding parent or step parent' 0'not a confiding parent or step parent'.

comment separating out all fathers and all mothers. 

DO IF B4A_ALLPARENTS = 1 AND N_GENDER = 1.
COMPUTE B4A_ALLFATHERS = 1. 
ELSE.
COMPUTE B4A_ALLFATHERS = 0.
END IF.

FREQUENCIES B4A_ALLFATHERS.

VALUE LABELS B4A_ALLFATHERS 1'Confiding Father or Step Father' 0'Not confiding father or step father'.

DO IF B4A_ALLPARENTS = 1 AND N_GENDER = 2.
COMPUTE B4A_ALLMOTHERS = 1. 
ELSE.
COMPUTE B4A_ALLMOTHERS = 0.
END IF.

FREQUENCIES B4A_ALLMOTHERS.

VALUE LABELS B4A_ALLMOTHERS 1'Confiding Mother or Step Mother' 0'Not a confiding step mother or step mother'.

DO IF B4A_ALLFATHERS = 1.
COMPUTE B4A_ALLPARENTGENDER = 1.
ELSE IF B4A_ALLMOTHERS = 1.
COMPUTE B4A_ALLPARENTGENDER = 2.
END IF.

FREQUENCIES B4A_ALLPARENTGENDER.

VALUE LABELS B4A_ALLPARENTGENDER 1'All Confiding Fathers' 2'All Confiding Mothers'.

comment selecting for confiding ties beyond the all parents.

DO IF B4A_ALLPARENTS = 0 AND B4A_YES = 1.
COMPUTE B4A_BEYONDALLPARENTS =1. 
END IF.

FREQUENCIES B4A_BEYONDALLPARENTS.

comment confiding vs not confiding parents. 

DO IF B4A_YES AND ALLPARENTS = 1.
COMPUTE B4A_ALLPARENTSCONTAINED = 1.
ELSE IF ALLPARENTS = 1.
COMPUTE B4A_ALLPARENTSCONTAINED = 0.
END IF.

FREQUENCIES B4A_ALLPARENTSCONTAINED.

VALUE LABELS B4A_ALLPARENTSCONTAINED 1'confiding parent or step parent' 0'a parent or step parent that is not confiding'.

DO IF B4A_YES =1 AND ALLFATHERS = 1.
COMPUTE B4A_ALLFATHERSCONTAINED = 1.
ELSE IF ALLFATHERS = 1.
COMPUTE B4A_ALLFATHERSCONTAINED = 0.
END IF.

FREQUENCIES B4A_ALLFATHERSCONTAINED.

VALUE LABELS B4A_ALLFATHERSCONTAINED 1'confiding father or step father' 0'A father or step father who is not confiding'.

DO IF B4A_YES =1 AND ALLMOTHERS = 1.
COMPUTE B4A_ALLMOTHERSCONTAINED = 1.
ELSE IF ALLMOTHERS = 1.
COMPUTE B4A_ALLMOTHERSCONTAINED = 0.
END IF.

FREQUENCIES B4A_ALLMOTHERSCONTAINED.

VALUE LABELS B4A_ALLMOTHERSCONTAINED 1'confiding mother or step mother' 0'mother or step mother who is not confiding'.


