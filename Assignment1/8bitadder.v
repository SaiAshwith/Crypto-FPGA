module bitadder(input a,
                      b,
                      cin,
                output s,
                       cout);

assign s = cin ^ (a ^ b);
assign cout = (a&b) | (cin&(a^b));

endmodule

module bit8adder(input[7:0] a,
                            b,
                 output[8:0] s);

       wire carry[6:0];
        bitadder b0(.a(a[0]), .b(b[0]), .cin(1'b0), .s(s[0]), .cout(carry[0]));
        bitadder b1(.a(a[1]), .b(b[1]), .cin(carry[0]), .s(s[1]), .cout(carry[1]));
        bitadder b2(.a(a[2]), .b(b[2]), .cin(carry[1]), .s(s[2]), .cout(carry[2]));
        bitadder b3(.a(a[3]), .b(b[3]), .cin(carry[2]), .s(s[3]), .cout(carry[3]));
        bitadder b4(.a(a[4]), .b(b[4]), .cin(carry[3]), .s(s[4]), .cout(carry[4]));
        bitadder b5(.a(a[5]), .b(b[5]), .cin(carry[4]), .s(s[5]), .cout(carry[5]));
        bitadder b6(.a(a[6]), .b(b[6]), .cin(carry[5]), .s(s[6]), .cout(carry[6]));
        bitadder b7(.a(a[7]), .b(b[7]), .cin(carry[6]), .s(s[7]), .cout(s[8]));
endmodule


module tb;

       reg[7:0] a,b;
       wire[8:0] sum;
       bit8adder ad(.a(a), .b(b), .s(sum));
       integer i ;
       initial begin
              for(i=0;i<10;i++) begin
                a <= ($random + 127);
                b <= ($random + 127);
                #2;
              end
       end

       initial
              $monitor("%0d %0d %0d",a,b,sum);

endmodule