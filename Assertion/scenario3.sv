//Assertion for signal A is high for a given positive edge clock cycle ,then B signal will be eventually high for the next clock cycle

module assertion;
  bit a,b;
  bit clk;
  initial 
    begin
      a=0;
      b=0;
      clk=0;
    end
  
  always #5clk=~clk;
  always@(negedge clk)
    begin
      a=$random%2;
      b=$random%2;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #100 $finish;
    end
  property p1;
    @(posedge clk)a ##[1:$]b;
  endproperty
  a1:assert property (p1)
    $info("Assertion pass at time %0t and value of a =%0b,b=%0b",$time,a,b);
    else
      $error("Assertion fail at time %0t and value of a =%0b,b=%0b",$time,a,b);
endmodule
