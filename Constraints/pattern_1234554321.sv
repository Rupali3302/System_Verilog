//Constraint for 1234554321

class pattern;
  rand int a[];
  constraint c1{a.size==10;}
  constraint c2{foreach(a[i])
    if(i<a.size/2)a[i]==i+1;
    else if(i==a.size/2)a[i]==i;
    else if (i>a.size/2)a[i]==a[i-1]-1;
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
