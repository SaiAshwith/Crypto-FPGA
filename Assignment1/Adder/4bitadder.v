`include "bitadder.v"

module bit4adder(input[3:0] a,
                            b,
                 output[4:0] s);

       wire carry[2:0];
       bitadder b0(.a(a[0]),
                   .b(b[0]),
                   .cin(1'b0),
                   .s(s[0]),
                   .cout(carry[0]));
       bitadder b1(.a(a[1]),
                   .b(b[1]),
                   .cin(carry[0]),
                   .s(s[1]),
                   .cout(carry[1]));
       bitadder b2(.a(a[2]),
                   .b(b[2]),
                   .cin(carry[1]),
                   .s(s[2]),
                   .cout(carry[2]));
       bitadder b3(.a(a[3]),
                   .b(b[3]),
                   .cin(carry[2]),
                   .s(s[3]),
                   .cout(s[4]));

endmodule