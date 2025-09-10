//Assertion to detect assertion of signal A

module assertion;
  bit a;
  bit clock;

  always #5 clock = ~clock;
  initial begin
    clock = 0;
    a = 0;
  end
  
  always @(negedge clock)
    begin
      a = $random % 2;  
    end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end

  property p1;
    @(posedge clock) a == 1;
  endproperty

  always @(posedge clock) 
    begin
    	a1: assert property (p1)
          $info("ASSERTION PASSED: 'a' is asserted,$time=%0d,Value = %0b",$time, a);
    	else
          $error("ASSERTION FAILED: 'a' is deasserted,,$time=%0d, Value = %0b", $time,a);
   end
endmodule
