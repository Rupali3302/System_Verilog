// Constraint for 2,3,5,6,8,9,11,12,14,15

class pattern;
  rand int a[];
  constraint c1{a.size==10;}
  constraint c2{foreach(a[i])
    if(i==0)a[i]==2;
    else if (i==1)a[i]==3;
    else if (i/2!=0)a[i]==a[i-2]+3;
                }
  
endclass

module mod;
  pattern p1;
  initial
    begin
      p1=new();
      p1.randomize();
      $display("The pattern is %p",p1.a);
    end
endmodule
