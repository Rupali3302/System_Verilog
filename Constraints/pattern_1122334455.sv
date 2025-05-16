/// Constraint to generate a pattern 1122334455
class c;
  rand bit [3:0] a[]; 
  constraint c1 { a.size == 10; } 
  constraint c2 { 
    foreach (a[i]) {
      if (i % 2 == 0) 
        a[i] == (i / 2) + 1; 
      else 
        a[i] == (i/ 2) + 1; 
    }
  }
endclass
module A;
  c c_h;
  initial begin
    c_h = new();
      c_h.randomize();
      $display("a = %p", c_h.a); 
  end
endmodule
