module one_bit (x,y,a,b);

   input x;
   input y;
   

   output a,b;
   wire a,b;
 

  assign a = ~(x^y);
assign b = x&(~y);
//assign c = (x<y)? 1 : 0;
endmodule

module eight_bit(A, B, x,y);

   input [7:0] A;
   input [7:0] B;
   

wire[7:0] a;
wire[7:0] b;

output x,y;

 
   one_bit uut1 (A[0], B[0], a[0],b[0]);
  one_bit uut2 (A[1], B[1], a[1],b[1]);
   one_bit uut3 (A[2], B[2], a[2],b[2]);
  one_bit uut4(A[3], B[3], a[3],b[3]);
   one_bit uut5 (A[4], B[4], a[4],b[4]);
  one_bit uut6(A[5], B[5], a[5],b[5]);
   one_bit uut7 (A[6], B[6], a[6],b[6]);
  one_bit uut8 (A[7], B[7], a[7],b[7]);

assign x = a[0] & a[1] & a[2] & a[3] & a[4] & a[5] & a[6] &a[7];
assign y = b[0] | (a[7] & b[6]) | (a[7]&a[6] & b[5]) | (a[7]&a[6]&a[5]&b[4]) | (a[7]&a[6]&a[5]&a[4]&b[3]) | (a[7]&a[6]&a[5]&a[4]&a[3]&b[2]) | (a[7]&a[6]&a[5]&a[4]&a[3]&a[2] &b[1]) | (a[7]&a[6]&a[5]&a[4]&a[3]&a[2] &a[1]&b[0]);


endmodule



// environment
module eight_bit_adder_top;

   reg [7:0] A;
   reg [7:0] B;
   
   
   wire a,b;

   eight_bit uut(A, B, a,b);
always @ (A or B or a or b) begin
    
       $display("Time = %d  ,A=%d , B=%d  , A==B = %d , A > B = %d , A<B = %d",$time, A,B , a , b , ~b);
end
 

    

 initial begin
      A = 100; B = 20; 
      #1
      $display("\n");
      A = 56; B = 75; 
      #1
      $display("\n");
      A = 45; B = 45; 
      #1
      $display("\n");
      A = 97; B = 34; 
      #1
      $display("\n");

        A = 123; B =122; 
      #1
      $display("\n");
      A = 4; B = 6; 
      #1
      $display("\n");

        A = 56; B = 56; 
      #1
      $display("\n");
      A = 11; B = 233; 
      #1
      $display("\n");

        A = 23; B = 2; 
      #1
      $display("\n");
      A = 1; B = 1; 
      #1
      $display("\n");
     
     $finish;
   end

initial begin
   #10
   $finish;
end

endmodule