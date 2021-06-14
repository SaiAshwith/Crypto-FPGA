module expansion(x, temp1);

   input[3:0] x;
  
   output[7:0] temp1;
   wire[7:0] temp1;
  
assign temp1[7] = x[0];
 assign temp1[6]= x[3];
assign temp1[5]= x[2];
assign temp1[4]= x[1];
assign temp1[3]= x[2];
assign temp1[2]= x[1];
assign temp1[1]= x[0];
assign temp1[0]= x[3];

endmodule


module xo(temp1, key, y);

   input[7:0] temp1,key;
  
   output[7:0] y;
   wire[7:0] y;
  
assign y = temp1^key;

endmodule

module substitution0(t1,temp3);

   input[3:0] t1;
  
   output[1:0] temp3;
   wire[1:0] temp3;

wire[1:0] a;
wire[1:0] b;
reg[31:0] sub [0:3] [0:3];


initial begin
sub[0][0] =1; sub[0][1]=0; sub[0][2] = 3; sub[0][3]=2; 
sub[1][0] =3; sub[1][1]=2; sub[1][2] =1; sub[1][3]=0; 
sub[2][0] = 0 ; sub[2][1]=2; sub[2][2] = 1; sub[2][3]=3; 
sub[3][0] = 3; sub[3][1]=1; sub[3][2] = 3; sub[3][3]=2; 
end


assign a  = {t1[2],t1[1]};
assign b  = {t1[3],t1[0]};

assign temp3 = sub[b][a];



endmodule




module substitution1(t1,temp3);

   input[3:0] t1;
  
   output[1:0] temp3;
   wire[1:0] temp3;

wire[1:0] a;
wire[1:0] b;
reg[31:0] sub [0:3] [0:3];


initial begin
sub[0][0] =0; sub[0][1]=1; sub[0][2] = 2; sub[0][3]=3; 
sub[1][0] =2; sub[1][1]=0; sub[1][2] =1; sub[1][3]=3; 
sub[2][0] = 3 ; sub[2][1]=0; sub[2][2] = 1; sub[2][3]=0; 
sub[3][0] = 2; sub[3][1]=1; sub[3][2] = 0; sub[3][3]=3; 
end


assign a  = {t1[2],t1[1]};
assign b  = {t1[3],t1[0]};

assign temp3 = sub[b][a];



endmodule



module permutation(temp5,y);

input[3:0] temp5;
output[3:0] y;
wire[3:0] y;

assign y[3]= temp5[2];
assign y[2]= temp5[0];
assign y[1] = temp5[1];
assign y[0]= temp5[3];

endmodule


module f_function(x, y,key);

   input [3:0] x;
input[7:0] key;
   output [3:0] y;
   wire[3:0] y;


wire[7:0] temp1,temp2;
wire[3:0] t1,t2,temp5;
wire[1:0] temp3,temp4;

  expansion uut1(x,temp1);
  xo uut2(temp1,key,temp2);

assign t1={temp2[7],temp2[6],temp2[5],temp2[4]};
assign t2={temp2[3],temp2[2],temp2[1],temp2[0]};
  
substitution0 uut3(t1 ,temp3);
substitution1 uut4(t2 , temp4);

assign temp5 ={temp3,temp4};
 
permutation uut5 (temp5 , y);
  

endmodule






module top;

   reg [3:0] right,left;
reg[7:0] key;
  wire [3:0] y;
 

  

   f_function uut(right,y,key);

   always @ (right or y or left) begin
      $display(" Original = %b%b, Encrypted output left = %b , Encrypted output right  = %b , key = %b ",  left,right, right, y^left, key);
   end

   initial begin
      right = 4'b1000; left = 4'b0110;  key = 8'b10100100; 
      #11
      $display("\n");
     
   end

initial begin
   #11
   $finish;
end

endmodule
