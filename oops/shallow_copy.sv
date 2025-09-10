//Shallow Copy

class c1;
  bit [9:0]a;
  bit b;
  function new(bit[9:0]a,bit b);
    this.a=a;
    this.b=b;
  endfunction
endclass

class c2;
  bit [7:0]c;
  bit d;
  c1 c1_h;
  
  function new();
    c=21;
    d=0;
    c1_h=new(10'd14,0);
  endfunction
  
  function void display();
    $display("child class c2: c=%d ,d=%b",c,d);
    $display("base class funx c1: a=%d,b=%b",c1_h.a,c1_h.b);
  endfunction
  
endclass

module shallow;
  c2 c2_h,c3_h;
  initial
    begin
      c2_h=new();
      $display("Initial values of a,b,c,d from c2_h");
      c2_h.display();
      $display("shallow copy of c3_h as c2_h");
      c3_h=new c2_h;
      c3_h.display();
      $display("--------------------------------------");
      $display("Updating values ");
      c2_h.c=100;
      c2_h.d=1;
      c2_h.c1_h.a=10;
      c2_h.c1_h.b=1;
      
      c2_h.display();
      $display("--------------------------------------");
      $display("checking for Properties and methods changed or not in c3_h");    
      c3_h.display();
      
    end
endmodule
