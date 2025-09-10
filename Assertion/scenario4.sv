//Assertion to detech if signal "A" is high on a given posedge of the clock,then signal B should be high for next 5 clock cycles followed by C should be high after B is high fot the fifth time

module assertion;
  bit a,b,c;
  bit clk;
  initial 
    begin
      a=0;
      b=0;
      c=0;
      clk=0;
    end
  
  always #5clk=~clk;
  always@(negedge clk)
    begin
      a=$random%2;
      b=$random%2;
      c=$random%2;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #100 $finish;
    end
  property p1;
    @(posedge clk)(a##1 b[=5]|->c);
  endproperty
  a1:assert property (p1)
    $info("Assertion pass at time %0t and value of a =%0b,b=%0b,c=%0b",$time,a,b,c);
    else
      $error("Assertion fail at time %0t and value of a =%0b,b=%0b,c=%0b",$time,a,b,c);
endmodule
