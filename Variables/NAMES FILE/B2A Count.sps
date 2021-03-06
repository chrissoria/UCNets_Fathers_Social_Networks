* Encoding: UTF-8.


comment count of social ties.

RECODE b2a (9,8,7,6,5,4,3,2,1 = 1) into B2A_YES.

FREQUENCIES B2A_Yes.

RECODE B2A_YES (SYSMIS = 0).

VALUE LABELS B2A_YES 1'social tie' 0'not social tie'.

comment breaking down social ties by gender.

DO IF N_GENDER = 1 AND B2A_YES =1.
COMPUTE MaleB2A = 1.
ELSE IF N_GENDER = 2 AND B2A_YES =1. 
COMPUTE MaleB2A = 2. 
END IF.

FREQUENCIES MaleB2a. 

VALUE LABELS MaleB2A 1'Male' 2'Female'.

comment separating out parents.

DO IF C1A_3 = 1 AND B2A_YES = 1.
COMPUTE B2A_PARENT = 1.
ELSE.
COMPUTE B2A_PARENT = 0.
END IF.

RECODE B2A_PARENT (SYSMIS = 0).

FREQUENCIES B2A_PARENT.

VALUE LABELS B2A_PARENT 0'Not Social Parent' 1'Social Parent'.

comment separating out mothers and fathers.

DO IF B2A_PARENT = 1 AND N_GENDER = 1.
COMPUTE B2A_FATHERS = 1. 
ELSE.
COMPUTE B2A_FATHERS = 0.
END IF.

FREQUENCIES B2A_FATHERS.

VALUE LABELS B2A_FATHERS 1'Social Fathers' 0'Not Social Fathers'.

DO IF B2A_PARENT = 1 AND N_GENDER = 2.
COMPUTE B2A_MOTHERS = 1. 
ELSE.
COMPUTE B2A_MOTHERS = 0.
END IF.

FREQUENCIES B2A_MOTHERS.

VALUE LABELS B2A_MOTHERS 1'Social Mothers' 0'Not Social Mothers'.

DO IF B2A_FATHERS = 1.
COMPUTE B2A_PARENTGENDER = 1.
ELSE IF B2A_MOTHERS = 1.
COMPUTE B2A_PARENTGENDER = 2.
END IF.

FREQUENCIES B2A_PARENTGENDER.

VALUE LABELS B2A_PARENTGENDER 1'Social Fathers' 2'Social Mothers'.

comment selecting for social ties beyond the parents.

DO IF B2A_PARENT = 0 AND B2A_YES = 1.
COMPUTE B2A_BEYONDPARENT =1. 
END IF.

FREQUENCIES B2A_BEYONDPARENT.

comment separating out step parents.

DO IF C1A_23 = 1 AND B2A_YES = 1.
COMPUTE B2A_STEPPARENT = 1.
ELSE.
COMPUTE B2A_STEPPARENT = 0.
END IF.

FREQUENCIES B2A_STEPPARENT.

RECODE B2A_STEPPARENT (SYSMIS = 0).

VALUE LABELS B2A_STEPPARENT 1'Social Step Parent' 0'Not a Social step parent'.

comment separating out step mother and step fathers.

DO IF B2A_STEPPARENT = 1 AND N_GENDER = 1.
COMPUTE B2A_STEPFATHERS = 1. 
ELSE.
COMPUTE B2A_STEPFATHERS = 0.
END IF.

FREQUENCIES B2A_STEPFATHERS.

VALUE LABELS B2A_STEPFATHERS 1'Social Step Fathers' 0'Not Social Step Fathers'.

DO IF B2A_STEPPARENT = 1 AND N_GENDER = 2.
COMPUTE B2A_STEPMOTHERS = 1. 
ELSE.
COMPUTE B2A_STEPMOTHERS = 0.
END IF.

FREQUENCIES B2A_STEPMOTHERS.

VALUE LABELS B2A_STEPMOTHERS 1'Social Step Mothers' 0'Not Social Step Mothers'.

DO IF B2A_STEPFATHERS = 1.
COMPUTE B2A_STEPPARENTGENDER = 1.
ELSE IF B2A_STEPMOTHERS = 1.
COMPUTE B2A_STEPPARENTGENDER = 2.
END IF.

FREQUENCIES B2A_STEPPARENTGENDER.

VALUE LABELS B2A_STEPPARENTGENDER 1'Social Step Fathers' 2'Social Step Mothers'.

comment selecting for social ties beyond the step parents.

DO IF B2A_STEPPARENT = 0 AND B2A_YES = 1.
COMPUTE B2A_BEYONDSTEPPARENT =1. 
END IF.

FREQUENCIES B2A_BEYONDSTEPPARENT.

comment combining step parents and parents.

DO IF B2A_PARENT = 1 OR B2A_STEPPARENT = 1.
COMPUTE B2A_ALLPARENTS = 1.
ELSE.
COMPUTE B2A_ALLPARENTS = 0. 
END IF. 

FREQUENCIES B2A_ALLPARENTS. 

VALUE LABELS B2A_ALLPARENTS 1'Social parent or step parent' 0'not a social parent or step parent'.

comment separating out all fathers and all mothers. 

DO IF B2A_ALLPARENTS = 1 AND N_GENDER = 1.
COMPUTE B2A_ALLFATHERS = 1. 
ELSE.
COMPUTE B2A_ALLFATHERS = 0.
END IF.

FREQUENCIES B2A_ALLFATHERS.

VALUE LABELS B2A_ALLFATHERS 1'Social Father or Step Father' 0'Not social father or step father'.

DO IF B2A_ALLPARENTS = 1 AND N_GENDER = 2.
COMPUTE B2A_ALLMOTHERS = 1. 
ELSE.
COMPUTE B2A_ALLMOTHERS = 0.
END IF.

FREQUENCIES B2A_ALLMOTHERS.

VALUE LABELS B2A_ALLMOTHERS 1'Social Mother or Step Mother' 0'Not a social step mother or step mother'.

DO IF B2A_ALLFATHERS = 1.
COMPUTE B2A_ALLPARENTGENDER = 1.
ELSE IF B2A_ALLMOTHERS = 1.
COMPUTE B2A_ALLPARENTGENDER = 2.
END IF.

FREQUENCIES B2A_ALLPARENTGENDER.

VALUE LABELS B2A_ALLPARENTGENDER 1'All Social Fathers' 2'All Social Mothers'.

comment selecting for social ties beyond the all parents.

DO IF B2A_ALLPARENTS = 0 AND B2A_YES = 1.
COMPUTE B2A_BEYONDALLPARENTS =1. 
END IF.

FREQUENCIES B2A_BEYONDALLPARENTS.

comment social vs not social parents. 

DO IF B2A_YES AND ALLPARENTS = 1.
COMPUTE B2A_ALLPARENTSCONTAINED = 1.
ELSE IF ALLPARENTS = 1.
COMPUTE B2A_ALLPARENTSCONTAINED = 0.
END IF.

FREQUENCIES B2A_ALLPARENTSCONTAINED.

VALUE LABELS B2A_ALLPARENTSCONTAINED 1'social parent or step parent' 0'a parent or step parent that is not social'.

DO IF B2A_YES =1 AND ALLFATHERS = 1.
COMPUTE B2A_ALLFATHERSCONTAINED = 1.
ELSE IF ALLFATHERS = 1.
COMPUTE B2A_ALLFATHERSCONTAINED = 0.
END IF.

FREQUENCIES B2A_ALLFATHERSCONTAINED.

VALUE LABELS B2A_ALLFATHERSCONTAINED 1'social father or step father' 0'A father or step father who is not social'.

DO IF B2A_YES =1 AND ALLMOTHERS = 1.
COMPUTE B2A_ALLMOTHERSCONTAINED = 1.
ELSE IF ALLMOTHERS = 1.
COMPUTE B2A_ALLMOTHERSCONTAINED = 0.
END IF.

FREQUENCIES B2A_ALLMOTHERSCONTAINED.

VALUE LABELS B2A_ALLMOTHERSCONTAINED 1'social mother or step mother' 0'mother or step mother who is not social'.
