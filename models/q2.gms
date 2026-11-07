sets
         t       index of time  /1*6/
;
parameters
         I0      beginning inventory                                     /150/
         N       beginning number of manpower                            /30/
         TT      available normal Production time                        /175/
         W0      available man_hours during normal production time       /5250/
         Cv      each product storage cost at the end of the period      /750000/
         Cr      each man_hour cost during normal production time        /17500/
         Co      each man_hour cost during overtime                      /24000/
         Ch      hiring new manforce cost                                /600000/
         Pt      man_hours required per unit of product                  /7/
         C       production cost per unit of product                     /8500000/
         P       allowed overtime percentage                             /0.25/
         D(t)    product demand in period t                              /1 750,2 600,3 540,4 500,5 540,6 590/
;
variables
         Z
;
positive variables
         X(t)    production number in month(t)
         I(t)    inventory at the end of month(t)
         H(t)    people employed in month(t)
         W(t)    available man_hours during normal production time in month(t)
         O(t)    required man_hours during overtime in month(t)
;
equations
         objectivefunction
         co10(t)
         co11(t)
         co20(t)
         co21(t)
         co3 (t)
         co4 (t)
;
objectivefunction                .. Z=e=sum((t),C*X(t)+Cv*I(t)+Cr*W(t)+Co*O(t)+Ch*H(t));
co10(t)          $(ord(t)=1)     .. I0+X(t)-I(t)=e=D(t);
co11(t)          $(ord(t)>1)     .. I(t-1)+X(T)-I(t)=e=D(t);
co20(t)          $(ord(t)=1)     .. W(t)=e=W0+H(t)*TT;
co21(t)          $(ord(t)>1)     .. W(t)=e=W(t-1)+H(t)*TT;
co3 (t)          $(ord(t)>0)     .. Pt*X(t)=l=W(t)+O(t);
co4 (t)          $(ord(t)>0)     .. O(t)=l=P*W(t);
model    production_planning      /all/
;
option   limrow=10, limcol=10
;
solve    production_planning using MIP minimizing Z
;
display  Z.l , X.l , I.l, H.l , W.l , O.l
;
