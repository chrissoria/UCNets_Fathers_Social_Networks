* Encoding: UTF-8.
FREQUENCIES k6s1 k6s2 k6s3 k6s4 k6s5 k6s6 k5.

FREQUENCIES k6s1.
RENAME VARIABLES (K6S1 = White).
FREQUENCIES White.

FREQUENCIES k6s2.
RENAME VARIABLES (K6S2 = Black).
FREQUENCIES Black.

FREQUENCIES k6s3.
RENAME VARIABLES (k6s3 = AmericanIndian).
FREQUENCIES AmericanIndian.

FREQUENCIES K6S4.
RENAME VARIABLES (K6S4 = Asian).
FREQUENCIES Asian.

FREQUENCIES K6S5.
RENAME VARIABLES (K6S5 = Latino).
FREQUENCIES Latino.

FREQUENCIES K6S6.
RENAME VARIABLES (K6S6 = OtherRace).
FREQUENCIES OtherRace.

FREQUENCIES k5.
RENAME VARIABLES (k5 = Hispanic).
FREQUENCIES Hispanic.

FREQUENCIES K2.

DO IF (latino = 1 OR hispanic = 1).
COMPUTE LatinoHispanic = 1.
ELSE.
COMPUTE LatinoHispanic = 0.
END IF.

VALUE LABELS LatinoHispanic 1'Hispanic or Latino' 0'Not Hispanic or Latino'.

FREQUENCIES Latino, Hispanic, LatinoHispanic.


DO IF (AmericanIndian = 1 OR OtherRace=1). 
COMPUTE RaceOther =1.
ELSE.
Compute RaceOther=0.
End If.
    
FREQUENCIES RaceOther, OtherRace, AmericanIndian.

DO IF (white = 1 AND LatinoHispanic = 0).
COMPUTE RACE = 0.
ELSE IF (black =1).
COMPUTE RACE = 1. 
ELSE IF (LatinoHispanic = 1 AND white = 0).
compute RACE = 2. 
ELSE IF (Asian = 1).
COMPUTE RACE = 3. 
ELSE.
COMPUTE RACE = 4. 
END IF.

FREQUENCIES RACE. 

VALUE LABELS RACE 0'white non-latino/hispanic' 1'black' 2'latino non-white' 3'Asian' 4'other'.



