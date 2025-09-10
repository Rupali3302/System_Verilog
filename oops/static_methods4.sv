//function static methods

class transaction;
  static int a;
  int b;
  function static int fun1();
    int s;
    a++;
    b++;
    s++;
  endfunction
endclass

module m1;
  transaction tr[6];
  initial 
    begin
      foreach (tr[i])
        begin
          tr[i]=new();
          tr[i].fun1();
          $display("Value of a = %0h, b = %0h,s = %0h", tr[i].a, tr[i].b,  tr[i].s);
    	end
    end
endmodule
