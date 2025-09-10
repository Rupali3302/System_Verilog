virtual class child;
  bit [5:0]b=15;
  function void display1();
    $display("value of b = %d",b);
  endfunction 
endclass

class child1 extends child;
  bit [5:0]b=45;
  function void display1();
    $display("value of b = %d",b);
  endfunction 
endclass

module mem;
  child1 c1;
  initial
    begin
      c1=new();
      c1.display1();
    end
endmodule
