//Constraint for 010101010101

class pattern;
  rand bit[4:0]a[];
  constraint c1{a.size()==10;}
  constraint c2{foreach (a[i])
    				if(i%2==0)
                      a[i]==0;
                    else a[i]==1;}
endclass

module m1;
  pattern p1;
  initial 
    begin
      p1=new();
      p1.randomize();
      $display("The patter in %p",p1.a);
    end
endmodule
