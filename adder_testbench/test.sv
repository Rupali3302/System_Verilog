`include "env.sv" 
program test(input intf);
  environment env;
  
  initial 
    begin 
      env=new(intf);
      env.gen.tx_count=20; 
      env.main(); 
      //$finish; 
    end 
endprogram
