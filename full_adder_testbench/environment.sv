
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  generator		gen;	
  driver		drv;
  monitor		mon;
  scoreboard	scb;
  
  mailbox m1;			
  mailbox m2;			
  event ev;
  
  virtual intf vif;	
  
  function new (virtual intf vif);
    this.vif = vif;
    
    m1 = new();		
    m2 = new();
    
    gen = new(m1);
    drv = new(vif,m1);
    mon = new(vif,m2);
    scb = new(m2);
    
    gen.ev = ev;    
    scb.ev = ev;   
  endfunction
  
  
  task test();			
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join_any
  endtask
  
  task run();			
    test();
    $finish;
  endtask
  
endclass

  
