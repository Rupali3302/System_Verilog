class driver;
  virtual intf vif;
  mailbox gen2driv; 
  function new(virtual intf vif,mailbox gen2driv); 
    this.vif=vif;
    this.gen2driv=gen2driv;
  endfunction 

task main();
  $display("------- DRIVER STARTED----------");
  forever begin
    transaction tx =new();
    gen2driv.get(tx);

    if (tx == null) begin
      $display("-------- DRIVER ENDED-----------");
      break;  
    end

    @(posedge vif.clock);
    vif.in1 <= tx.in1;
    vif.in2 <= tx.in2;
    tx.print("Driver");
    $display("Drived the signals");
  end
endtask

endclass
