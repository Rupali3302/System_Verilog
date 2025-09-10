//Assertion to detect de-assertion of a signal B

module assertion;
  bit clock;
  bit b;
  always #5 clock=~clock;
  initial 
    begin
      clock=0;
      b=1;
    end
  
   always @(negedge clock)
    begin
      b = $random % 2;  
    end 
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #100 $finish;
    end
  
  property p1;
    @(posedge clock)b==0;
  endproperty
  always@(posedge clock)
    begin
      a1:assert property(p1)
        $info("Assertio passed at time=%0t ,Value of B is %0b",$time,b);
    	else
          $error("Assertion failed at time=%0t ,Value of B is %0b",$time,b);
    end
endmodule
