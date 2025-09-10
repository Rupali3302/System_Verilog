`include "interface.sv" 
//`include "test.sv"
`include "env.sv"
module testbench_top; 
   
  intf intf_top();
  
  environment env;
  //test test(intf_top); 
  adder DUT(.clock(intf_top.clock), .reset(intf_top.reset), .in1(intf_top.in1), .in2(intf_top.in2), .out(intf_top.out));
  
  always #5 intf_top.clock = ~intf_top.clock; 
   
  
  initial begin 
    intf_top.clock = 0; 
    intf_top.reset = 1;
    @(negedge intf_top.clock) 
    intf_top.reset = 0; 
 
  end 
  
 
  initial 
    begin 
      env=new(intf_top);
      env.gen.tx_count=20; 
      env.main(); 
      //$finish; 
    end 
  
  initial begin
    //est test(intf_top);
    $dumpfile("dump.vcd"); $dumpvars();
    #300 $finish;
 end 
endmodule
