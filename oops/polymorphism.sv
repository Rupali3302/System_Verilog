
class parent;
  bit [5:0]a;
  virtual function void display();
    $display("Parent_class a=%d",a);
  endfunction
endclass

class c1 extends parent;
  function void display();
    $display("C1_class a=%d",a);
  endfunction
endclass

class c2 extends parent;
  function void display();
    $display("C2_class a=%d",a);
  endfunction
endclass

class c3 extends parent;
  function void display();
    $display("C3_class a=%d",a);
  endfunction
endclass

module poly;
  initial 
    begin
      parent p1,p2,p3;
      c1 c1_h=new();
      c2 c2_h=new();
      c3 c3_h=new();
      
      c1_h.a=10;
      c2_h.a=20;
      c3_h.a=30;
      
      p1=c1_h;
      p2=c2_h;
      p3=c3_h;
      
      p1.display();
      p2.display();
      p3.display();
      
      
    end
  
endmodule
