`include "generator.sv" 
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv" 
class environment; 
  generator gen;
  driver driv;
  monitor mon; 
  scoreboard scb; 
  virtual intf vif;
  mailbox gen2driv;
  mailbox mon2scb;
  function new(virtual intf vif);
    this.vif=vif; 
    gen2driv=new();
    mon2scb=new(); 
    gen=new(gen2driv); 
    driv=new(vif,gen2driv);
    mon=new(vif,mon2scb); 
    scb=new(mon2scb);
  endfunction
  task main();
    fork gen.main();
      driv.main();
      mon.main(); 
      scb.main(); 
    join_none //$finish; 
  endtask 
endclass
