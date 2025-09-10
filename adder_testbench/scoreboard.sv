class scoreboard;
  mailbox mon2scb;
  bit [4:0]in1_fifo[$];
  bit [4:0]in2_fifo[$]; 
  function new(mailbox mon2scb); 
    this.mon2scb=mon2scb; 
  endfunction 
  task main(); 
    fork 
      get_input();
      get_output;
    join_none 
  endtask
  task get_input();
    transaction tx;
    forever begin 
      mon2scb.get(tx);
      in1_fifo.push_back(tx.in1); 
      in2_fifo.push_back(tx.in2);
      $display("Inputs received at SCOREBOARD = %0d, %0d", tx.in1, tx.in2);
    end 
  endtask 
  task get_output(); 
    transaction tx;
    bit [4:0]a,b;
    int res;
    forever begin
      mon2scb.get(tx);
      tx.print(" MON@SCRB TXNS");
      a=in1_fifo.pop_front;
      b=in2_fifo.pop_front;
      res=a+b;
      if((res)!=tx.out) 
        begin
        	$error("Wrong Result --- Inputs = %0d and %0d --- Output = %0d", a, b, tx.out); 
        end
       else 
         begin
        	$display("DATA MATCHED in1= %0d and in2 = %0d expected sum = %0d and actual sum = %0d",a,b,res,tx.out);
         end
    end 
  endtask 
endclass
