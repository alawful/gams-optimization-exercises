sets
       i time period /1*8/
;
parameters
         C(i) salary of time period (i) /1 54,2 57,3 48,4 42,5 42,6 42,7 42, 8 45/
         D(i) least number of workers needed in time period (i) /1 5,2 7,3 15,4 21,5 22,6 12,7 7,8 3/
;
variable
         Z;
integer variable
         X(i) number of workers in time period (i) ;
         X.up(i)=1000 ;

Equations
obj_func
co1 (i)
co2 (i);

obj_func                             .. Z=e=sum((i),C(i)*X(i));
co1 (i)          $(ord(i)=1)         .. X(i)+X(i+7)=g=D(i);
co2 (i)          $(ord(i)>1)         .. X(i)+X(i-1)=g=D(i);

model num_of_workers /all/;
option limrow=10 , limcol=10;
solve num_of_workers using MIP minimizing Z;
display Z.l , X.l;