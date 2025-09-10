//Assertion to make sure output signal never goes X
module assertion;
  bit a;
  bit clock;
  bit en;

  always #5 clock = ~clock;
  initial begin
    clock = 0;
    a = 0;
    en=0;
  end
  
  always @(negedge clock)
    begin
      a = $random % 2; 
      en=$random % 2; 
      #35;
      a=1'bx;
    end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end

  property p1;
    @(posedge clock)
    $rose(en)|->!($isunknown(a));
  endproperty

  always @(posedge clock) 
    begin
    	a1: assert property (p1)
          $info("ASSERTION PASSED: 'a' is asserted,$time=%0d,en=%0b,Value = %0b",$time,en, a);
    	else
          $error("ASSERTION FAILED: 'a' is deasserted,,$time=%0d,en=%0b, Value = %0b", $time,en,a);
   end
endmodule
