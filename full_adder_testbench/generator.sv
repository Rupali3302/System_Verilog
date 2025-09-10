class generator;
  event ev;
  mailbox gen2drv;
  transaction trans;
  
  function new(mailbox gen2drv);
    trans=new();
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    repeat(10)
      begin
        assert(trans.randomize)
          else
            $error("Gen randomiztion failed");
        trans.display("Gen");
        gen2drv.put(trans);
        @(ev);
      end
  endtask
endclass
