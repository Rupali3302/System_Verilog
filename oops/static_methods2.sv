//Static methods 

class a;
  int m;
  static int s_n;
  
  static function void f2();
    s_n++;
   // m++;
  endfunction
  
  function void f1();
    s_n++;
    m++;
  endfunction
  
endclass

module m1;
  a a_h[];
  initial
    begin
      a_h =new[6];
      foreach(a_h[i])
        begin
          a_h[i]=new();
          a_h[i].f1;
          $display("Value of s_n = %0h, m = %0h", a_h[i].s_n, a_h[i].m);
        end
      foreach(a_h[i])
        begin
          a_h[i].f2;
          $display("Value of s_n = %0h, m = %0h", a_h[i].s_n, a_h[i].m);
        end
    end
endmodule
