module t_ff_tb;
  reg clk,rst,t;
  wire q,qbar;
  t_ff dut(clk,rst,t,q,qbar);
  always #5 clk=~clk;
  
  initial
    begin
      clk=0;
      rst=0;
      #70;
      $dumpfile("dump.vcd");
      $dumpvars;
      $finish;
    end
  always@(negedge clk)
    begin
      t=$random;
    end
  a1:assert property (@(posedge clk)disable iff(rst)t|->$past(q,1))
    $info("Assertion passed");
    else
      $info("Assertion failed");

endmodule
