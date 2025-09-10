//Assertion for the signal to be stable
//Current evalution and previous evaluation point the value must be same

module assertion;
  bit clk;
  bit a;
  always #5 clk=~clk;
  initial
    begin
      clk=0;a=0;
    end
  always@(negedge clk)
     begin
         a=$random%2;
     end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #150 $finish;
      
    end
  property p1;
    @(posedge clk)$rose(a);
  endproperty
  always@(posedge clk)
    begin
      a1:assert property (p1)
        $info("Assertion passed at time=%0t and value of a is %0b",$time,a);
    	else
          $error("Assertion failed at time=%0t and value of a is %0b",$time,a);
    end
endmodule
