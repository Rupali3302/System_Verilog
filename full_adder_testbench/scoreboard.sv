class scoreboard;
  event ev;
  mailbox mon2scb;
  transaction trans;
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task main;
    forever 
      begin
        mon2scb.get(trans);
        trans.display("SCB");
      if (((trans.a ^ trans.b ^ trans.cin) == trans.sum) && 
    (((trans.a & trans.b) | (trans.b & trans.cin) | (trans.cin & trans.a)) == trans.cout)) 
    $display("Verification Passed! :)");
else
  $error("Verification Failed!");
        $display("-----------------------");
		->ev;
      end
  endtask
endclass
