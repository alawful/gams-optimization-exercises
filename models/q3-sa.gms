sets
i factories              /1,2/
j inventories            /1,2/
k shops                  /1,2,3/
m loops inndex           /1*50/
;
parameters
         S(i) supply                     /1 50   ,2 100/
         V(j) inventory capaticity       /1 80   ,2 80/
         D(k) demamd                     /1 20   ,2 40   ,3 90/
         Result1 (m,*)
         Result2 (m,i,j,*)
         Result3 (m,j,k,*)
;
table C(i,j) cost of transportation from the factories to the inventories
         1       2
1        8       10
2        9       11
;
table Cp(j,k) cost of transportation from the inventories to the shops
         1       2       3
1        3       7       4
2        2       1       6
;
variable
         Z
;
integer variables
         X(i,j) products transported from factory (i) to inventory (j)
         Y(J,K) Products transported from inventory (j) to shop (k)
;
equations
         objectivefunction
         co1(i)
         co2(j)
         co3(j)
         co4(k)
;
objectivefunction        .. Z=e=sum((i,j),C(i,j)*X(i,j))+sum((j,k),Cp(j,k)*Y(j,k));
co1(i)                   .. sum((j),X(i,j))=l=S(I);
co2(j)                   .. sum((i),X(i,j))=l=V(j);
co3(j)                   .. sum((k),Y(j,k))=l=sum((i),X(i,j));
co4(k)                   .. sum((j),Y(j,k))=g=D(K);
model    transportation_problem /all/;
loop(m,
solve    transportation_problem using MIP minimizing Z;
Result1  (m,'Inventory1')=v('1');
Result1  (m,'Z')=Z.l;
Result2  (m,i,j,'X')=X.l(i,j);
Result3  (m,j,k,'Y')=Y.l(j,k);
v('1')=v('1')+1;
);
display  Result1, Result2, Result3
;
execute_unload   'q3-sa.Gdx'
;
