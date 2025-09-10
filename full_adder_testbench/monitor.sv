class monitor;
  virtual intf vif;
  mailbox mon2scb;
  transaction trans;
  
  function new( virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
    trans=new();
  endfunction
  
  task main;
    forever begin
      #4;
      trans.a=vif.a;
      trans.b=vif.b;
      trans.cin=vif.cin;
      trans.sum=vif.sum;
      trans.cout=vif.cout;
      mon2scb.put(trans);
      trans.display("monitor");
    end
  endtask
endclass
