*jjjch, 6/21/2020;
*After reading the following two articles, I decided to implement it in GAMS;

*ordering of binary variables;
*https://stackoverflow.com/questions/62432731/optimize-with-indexing-in-linear-programming;
*Optimize with indexing in linear programming;
*https://yetanothermathprogrammingconsultant.blogspot.com/2020/06/small-example-ordering-of-binary.html;

Set    i   indexes         /1*9/;
Parameters
     v(i)  value at index i
       /
1	1
2	3
3	6
4	4
5	7
6	9
7	6
8	2
9	3
/
;

variable y_left, y_right, k;
binary variable delta(i);
variable z;

equation def_y_left, def_y_right, def_k, def_delta(i);
equation def_z1, def_z2, def_z3;

def_y_left .. y_left =E= sum(i, (1-delta(i))*v(i));
def_y_right .. y_right =E= sum(i, delta(i)*v(i));
def_k .. k =E= 1 + sum(i, 1-delta(i));
def_delta(i)$(ord(i)<card(i)) .. delta(i+1) =G= delta(i);
def_z1 .. - z =L= y_left - y_right;
def_z2 .. y_left - y_right =L= z;
def_z3 .. z =G= 0;

model my_model /all/;

solve my_model using MIP minimizaing z;
