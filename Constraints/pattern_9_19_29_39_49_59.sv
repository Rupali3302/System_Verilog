// Constraint for 9,19,29,39,49,59,69,79,89,99

class pattern;
  rand int a[];
  constraint c1{a.size()==10;}

  constraint c3{foreach(a[i])
    if(i==0)a[i]==9;
    else a[i]==a[i-1]+10; }
  
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
