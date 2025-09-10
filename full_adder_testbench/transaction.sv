class transaction;
  rand bit a;
  rand bit b;
  rand bit cin;
  bit sum,cout;
  
  function void display(string name);
    $display("a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);
  endfunction
endclass
