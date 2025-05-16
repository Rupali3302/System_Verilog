class constraint1;
  randc bit [7:0]a;
  constraint c1{a inside {[0:30]};}
  constraint c2{a%2==1;}
endclass
module A;
  constraint1 m;
  initial 
    begin
      m=new();
      repeat(10)
        begin
     		 m.randomize();
     	     $display("a=%d",m.a);
        end
    end
endmodule
