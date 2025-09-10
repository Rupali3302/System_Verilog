class transaction; 
  rand bit [4:0] in1;
  rand bit [4:0] in2; 
  bit [5:0] out; 
  function void print (string name); 
    $display("*******Transactions in %0s*******",name); $display("Inputs in1 = %0h, in2 = %0h, and out = %0h", in1, in2, out); 
  endfunction: print
endclass
