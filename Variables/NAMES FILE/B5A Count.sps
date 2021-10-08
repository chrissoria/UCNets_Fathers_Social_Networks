* Encoding: UTF-8.
comment count of advice giving ties.

RECODE B5A (6,5,4,3,2,1 = 1) into B5A_YES.

FREQUENCIES B5A_Yes.

RECODE B5A_YES (SYSMIS = 0).

VALUE LABELS B5A_YES 1'advice giving tie' 0'not advice giving tie'.

comment breaking down advice giving ties by gender.

DO IF N_GENDER = 1 AND B5A_YES =1.
COMPUTE MaleB5A = 1.
ELSE IF N_GENDER = 2 AND B5A_YES =1. 
COMPUTE MaleB5A = 2. 
END IF.

FREQUENCIES MaleB5A. 

VALUE LABELS MaleB5A 1'Male' 2'Female'.

comment separating out parents.

DO IF C1A_3 = 1 AND B5A_YES = 1.
COMPUTE B5A_PARENT = 1.
ELSE.
COMPUTE B5A_PARENT = 0.
END IF.

RECODE B5A_PARENT (SYSMIS = 0).

FREQUENCIES B5A_PARENT.

VALUE LABELS B5A_PARENT 0'Not Advice giving Parent' 1'Advice giving Parent'.

comment separating out mothers and fathers.

DO IF B5A_PARENT = 1 AND N_GENDER = 1.
COMPUTE B5A_FATHERS = 1. 
ELSE.
COMPUTE B5A_FATHERS = 0.
END IF.

FREQUENCIES B5A_FATHERS.

VALUE LABELS B5A_FATHERS 1'Advice giving Fathers' 0'Not Advice giving Fathers'.

DO IF B5A_PARENT = 1 AND N_GENDER = 2.
COMPUTE B5A_MOTHERS = 1. 
ELSE.
COMPUTE B5A_MOTHERS = 0.
END IF.

FREQUENCIES B5A_MOTHERS.

VALUE LABELS B5A_MOTHERS 1'Advice giving Mothers' 0'Not Advice giving Mothers'.

DO IF B5A_FATHERS = 1.
COMPUTE B5A_PARENTGENDER = 1.
ELSE IF B5A_MOTHERS = 1.
COMPUTE B5A_PARENTGENDER = 2.
END IF.

FREQUENCIES B5A_PARENTGENDER.

VALUE LABELS B5A_PARENTGENDER 1'Advice giving Fathers' 2'Advice giving Mothers'.

comment selecting for advice giving ties beyond the parents.

DO IF B5A_PARENT = 0 AND B5A_YES = 1.
COMPUTE B5A_BEYONDPARENT =1. 
END IF.

FREQUENCIES B5A_BEYONDPARENT.

comment separating out step parents.

DO IF C1A_23 = 1 AND B5A_YES = 1.
COMPUTE B5A_STEPPARENT = 1.
ELSE.
COMPUTE B5A_STEPPARENT = 0.
END IF.

FREQUENCIES B5A_STEPPARENT.

RECODE B5A_STEPPARENT (SYSMIS = 0).

VALUE LABELS B5A_STEPPARENT 1'Advice giving Step Parent' 0'Not a Advice giving step parent'.

comment separating out step mother and step fathers.

DO IF B5A_STEPPARENT = 1 AND N_GENDER = 1.
COMPUTE B5A_STEPFATHERS = 1. 
ELSE.
COMPUTE B5A_STEPFATHERS = 0.
END IF.

FREQUENCIES B5A_STEPFATHERS.

VALUE LABELS B5A_STEPFATHERS 1'Advice giving Step Fathers' 0'Not Advice giving Step Fathers'.

DO IF B5A_STEPPARENT = 1 AND N_GENDER = 2.
COMPUTE B5A_STEPMOTHERS = 1. 
ELSE.
COMPUTE B5A_STEPMOTHERS = 0.
END IF.

FREQUENCIES B5A_STEPMOTHERS.

VALUE LABELS B5A_STEPMOTHERS 1'Advice giving Step Mothers' 0'Not Advice giving Step Mothers'.

DO IF B5A_STEPFATHERS = 1.
COMPUTE B5A_STEPPARENTGENDER = 1.
ELSE IF B5A_STEPMOTHERS = 1.
COMPUTE B5A_STEPPARENTGENDER = 2.
END IF.

FREQUENCIES B5A_STEPPARENTGENDER.

VALUE LABELS B5A_STEPPARENTGENDER 1'Advice giving Step Fathers' 2'Advice giving Step Mothers'.

comment selecting for advice giving ties beyond the step parents.

DO IF B5A_STEPPARENT = 0 AND B5A_YES = 1.
COMPUTE B5A_BEYONDSTEPPARENT =1. 
END IF.

FREQUENCIES B5A_BEYONDSTEPPARENT.

comment combining step parents and parents.

DO IF B5A_PARENT = 1 OR B5A_STEPPARENT = 1.
COMPUTE B5A_ALLPARENTS = 1.
ELSE.
COMPUTE B5A_ALLPARENTS = 0. 
END IF. 

FREQUENCIES B5A_ALLPARENTS. 

VALUE LABELS B5A_ALLPARENTS 1'Advice giving parent or step parent' 0'not a advice giving parent or step parent'.

comment separating out all fathers and all mothers. 

DO IF B5A_ALLPARENTS = 1 AND N_GENDER = 1.
COMPUTE B5A_ALLFATHERS = 1. 
ELSE.
COMPUTE B5A_ALLFATHERS = 0.
END IF.

FREQUENCIES B5A_ALLFATHERS.

VALUE LABELS B5A_ALLFATHERS 1'Advice giving Father or Step Father' 0'Not advice giving father or step father'.

DO IF B5A_ALLPARENTS = 1 AND N_GENDER = 2.
COMPUTE B5A_ALLMOTHERS = 1. 
ELSE.
COMPUTE B5A_ALLMOTHERS = 0.
END IF.

FREQUENCIES B5A_ALLMOTHERS.

VALUE LABELS B5A_ALLMOTHERS 1'Advice giving Mother or Step Mother' 0'Not a advice giving step mother or step mother'.

DO IF B5A_ALLFATHERS = 1.
COMPUTE B5A_ALLPARENTGENDER = 1.
ELSE IF B5A_ALLMOTHERS = 1.
COMPUTE B5A_ALLPARENTGENDER = 2.
END IF.

FREQUENCIES B5A_ALLPARENTGENDER.

VALUE LABELS B5A_ALLPARENTGENDER 1'All Advice giving Fathers' 2'All Advice giving Mothers'.

comment selecting for advice giving ties beyond the all parents.

DO IF B5A_ALLPARENTS = 0 AND B5A_YES = 1.
COMPUTE B5A_BEYONDALLPARENTS =1. 
END IF.

FREQUENCIES B5A_BEYONDALLPARENTS.

comment advice giving vs not advice giving parents. 

DO IF B5A_YES AND ALLPARENTS = 1.
COMPUTE B5A_ALLPARENTSCONTAINED = 1.
ELSE IF ALLPARENTS = 1.
COMPUTE B5A_ALLPARENTSCONTAINED = 0.
END IF.

FREQUENCIES B5A_ALLPARENTSCONTAINED.

VALUE LABELS B5A_ALLPARENTSCONTAINED 1'advice giving parent or step parent' 0'a parent or step parent that is not advice giving'.

DO IF B5A_YES =1 AND ALLFATHERS = 1.
COMPUTE B5A_ALLFATHERSCONTAINED = 1.
ELSE IF ALLFATHERS = 1.
COMPUTE B5A_ALLFATHERSCONTAINED = 0.
END IF.

FREQUENCIES B5A_ALLFATHERSCONTAINED.

VALUE LABELS B5A_ALLFATHERSCONTAINED 1'advice giving father or step father' 0'A father or step father who is not advice giving'.

DO IF B5A_YES =1 AND ALLMOTHERS = 1.
COMPUTE B5A_ALLMOTHERSCONTAINED = 1.
ELSE IF ALLMOTHERS = 1.
COMPUTE B5A_ALLMOTHERSCONTAINED = 0.
END IF.

FREQUENCIES B5A_ALLMOTHERSCONTAINED.

VALUE LABELS B5A_ALLMOTHERSCONTAINED 1'advice giving mother or step mother' 0'mother or step mother who is not advice giving'.

FREQUENCIES B2A_ALLFATHERSCONTAINED, B4A_ALLFATHERSCONTAINED, B5A_ALLFATHERSCONTAINED.

