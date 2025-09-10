class monitor; 
  virtual intf vif;
  mailbox mon2scb;
  transaction tx; 
  function new(virtual intf vif,mailbox mon2scb); 
    this.vif=vif; 
    this.mon2scb=mon2scb; 
  endfunction
  task main(); 
    $display("---------------MONITOR STARTED--------------");
    forever begin tx = new();
      @(posedge vif.clock);
      tx.in1 = vif.in1; 
      tx.in2 = vif.in2;
     @(posedge vif.clock);
      tx.out = vif.out; 
      tx.print("Monitor");
      mon2scb.put(tx); 
    end 
    $display("-------------- MONITOR ENDED------------------"); 
  endtask
endclass
