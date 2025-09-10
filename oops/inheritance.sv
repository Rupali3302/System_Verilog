
class parent;
  bit [5:0]a=30;
  function void display1();
    $display("value of a = %d",a);
  endfunction
endclass

class child extends parent;
  bit [5:0]b=15;
  function void display1();
    $display("value of b = %d",b);
  endfunction 
endclass

module mem;
  parent p1;
  child c1;
  initial
    begin
      c1=new();
      p1=new();
      //p1.display1();
      c1.display1();
    end
endmodule
