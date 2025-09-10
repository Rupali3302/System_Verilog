class driver;
  virtual intf vif;
  mailbox gen2drv;
  transaction trans;

  function new(virtual intf vif,mailbox gen2drv);
    this.vif=vif;
    this.gen2drv=gen2drv;
  endfunction
  
  task main;
    forever 
      begin
        gen2drv.get(trans);
        vif.a<=trans.a;
        vif.b<=trans.b;
        vif.cin<=trans.cin;
        
        trans.sum=vif.sum;
        trans.cout=vif.cout;
        
        trans.display("Driver");
      end
  endtask
endclass
