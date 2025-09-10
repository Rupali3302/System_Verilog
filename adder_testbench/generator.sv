`include "transaction.sv"
class generator;
  transaction tx; 
  mailbox gen2driv; 
  int tx_count;
  event e1;
  function new(mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  task main(); 
    $display("[ GENERATOR ] ****** GENERATOR STARTED ******");
    repeat(tx_count) 
      begin tx = new(); 
        assert(tx.randomize());
        gen2driv.put(tx); 
      end 
    gen2driv.put(null);
    $display("[ GENERATOR ] ****** GENERATOR ENDED ******");
  endtask 
endclass
