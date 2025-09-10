//Static methods with scope resolution 

class a;
  int m;
  static int s_n;
  static function void f2();
    s_n++;
  endfunction  
endclass

module m1;
  a a_h;
  initial
    begin
      a_h =new();
      
      repeat(5)
        begin
          a::f2;
          $display("With scope resolution operator Value of s_n = %0h",a::s_n);
        end
      repeat (5)
        begin
          a_h.f2();
      	  $display("With handle Value of s_n = %0h", a_h.s_n);
        end
      
    end
endmodule
