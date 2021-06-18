module initialperm(input wire[0:63] in,
                   output wire[0:63] out);

//always @(in) begin

assign out = {in[57],in[49],in[41],in[33],in[25],in[17],in[9],in[1],
              in[59],in[51],in[43],in[35],in[27],in[19],in[11],in[3],
              in[61],in[53],in[45],in[37],in[29],in[21],in[13],in[5],
              in[63],in[55],in[47],in[39],in[31],in[23],in[15],in[7],
              in[56],in[48],in[40],in[32],in[24],in[16],in[8],in[0],
              in[58],in[50],in[42],in[34],in[26],in[18],in[10],in[2],
              in[60],in[52],in[44],in[36],in[28],in[20],in[12],in[4],
              in[62],in[54],in[46],in[38],in[30],in[22],in[14],in[6]};
    
//end

endmodule

//------------------------------------////------------------------------------////------------------------------------////------------------------------------//

module finalperm(input wire[0:63] in,
                 output wire[0:63] out);

//always @(in) begin

assign out = {in[39],in[7],in[47],in[15],in[55],in[23],in[63],in[31],
              in[38],in[6],in[46],in[14],in[54],in[22],in[62],in[30],
              in[37],in[5],in[45],in[13],in[53],in[21],in[61],in[29],
              in[36],in[4],in[44],in[12],in[52],in[20],in[60],in[28],
              in[35],in[3],in[43],in[11],in[51],in[19],in[59],in[27],
              in[34],in[2],in[42],in[10],in[50],in[18],in[58],in[26],
              in[33],in[1],in[41],in[9],in[49],in[17],in[57],in[25],
              in[32],in[0],in[40],in[8],in[48],in[16],in[56],in[24]};
    
//end

endmodule

//------------------------------------////------------------------------------////------------------------------------////------------------------------------//

module expand(input wire[0:31] in,
              output wire[0:47] out);

//always @(inp) begin

assign out = {in[31], in[0], in[1], in[2], in[3], in[4],
              in[3], in[4], in[5], in[6], in[7], in[8],
              in[7], in[8], in[9], in[10], in[11], in[12],
              in[11], in[12], in[13], in[14], in[15], in[16],
              in[15], in[16], in[17], in[18], in[19], in[20],
              in[19], in[20], in[21], in[22], in[23], in[24],
              in[23], in[24], in[25], in[26], in[27], in[28],
              in[27], in[28], in[29], in[30], in[31], in[0]};

//end

endmodule

//------------------------------------////------------------------------------////------------------------------------////------------------------------------//

module inboxperm(input wire[0:31] in,
                 output wire[0:31] out);

//always @(in) begin

assign out = {in[15],in[6],in[19],in[20],in[28],in[11],in[27],in[16],
              in[0],in[14],in[22],in[25],in[4],in[17],in[30],in[9],
              in[1],in[7],in[23],in[13],in[31],in[26],in[2],in[8],
              in[18],in[12],in[29],in[5],in[21],in[10],in[3],in[24]};

//end

endmodule

//------------------------------------////------------------------------------////------------------------------------////------------------------------------//

module keyXor(input[0:47] in, key,
           output[0:47] out);

assign out = in ^ key ;

endmodule

//------------------------------------////------------------------------------////------------------------------------////------------------------------------//

module sboxes(input wire[0:47] in,
              output wire[0:31] out);

reg[0:3] s1[0:3][0:15], s2[0:3][0:15], s3[0:3][0:15], s4[0:3][0:15],
          s5[0:3][0:15], s6[0:3][0:15], s7[0:3][0:15], s8[0:3][0:15] ;

wire[0:1] ext[0:7] ;

wire[0:4] mid[0:7] ;

integer i;

initial begin

s1[0][0] = 4'd14; s1[0][1] = 4'd4; s1[0][2] = 4'd13; s1[0][3] = 4'd1; s1[0][4] = 4'd2; s1[0][5] = 4'd15; s1[0][6] = 4'd11; s1[0][7] = 4'd8; s1[0][8] = 4'd3; s1[0][9] = 4'd10; s1[0][10] = 4'd6; s1[0][11] = 4'd12; s1[0][12] = 4'd5; s1[0][13] = 4'd9; s1[0][14] = 4'd0; s1[0][15] = 4'd7; 
s1[1][0] = 4'd0; s1[1][1] = 4'd15; s1[1][2] = 4'd7; s1[1][3] = 4'd4; s1[1][4] = 4'd14; s1[1][5] = 4'd2; s1[1][6] = 4'd13; s1[1][7] = 4'd1; s1[1][8] = 4'd10; s1[1][9] = 4'd6; s1[1][10] = 4'd12; s1[1][11] = 4'd11; s1[1][12] = 4'd9; s1[1][13] = 4'd5; s1[1][14] = 4'd3; s1[1][15] = 4'd8; 
s1[2][0] = 4'd4; s1[2][1] = 4'd1; s1[2][2] = 4'd14; s1[2][3] = 4'd8; s1[2][4] = 4'd13; s1[2][5] = 4'd6; s1[2][6] = 4'd2; s1[2][7] = 4'd11; s1[2][8] = 4'd15; s1[2][9] = 4'd12; s1[2][10] = 4'd9; s1[2][11] = 4'd7; s1[2][12] = 4'd3; s1[2][13] = 4'd10; s1[2][14] = 4'd5; s1[2][15] = 4'd0; 
s1[3][0] = 4'd15; s1[3][1] = 4'd12; s1[3][2] = 4'd8; s1[3][3] = 4'd2; s1[3][4] = 4'd4; s1[3][5] = 4'd9; s1[3][6] = 4'd1; s1[3][7] = 4'd7; s1[3][8] = 4'd5; s1[3][9] = 4'd11; s1[3][10] = 4'd3; s1[3][11] = 4'd14; s1[3][12] = 4'd10; s1[3][13] = 4'd0; s1[3][14] = 4'd6; s1[3][15] = 4'd13;

s2[0][0] = 4'd15; s2[0][1] = 4'd1; s2[0][2] = 4'd8; s2[0][3] = 4'd14; s2[0][4] = 4'd6; s2[0][5] = 4'd11; s2[0][6] = 4'd3; s2[0][7] = 4'd4; s2[0][8] = 4'd9; s2[0][9] = 4'd7; s2[0][10] = 4'd2; s2[0][11] = 4'd13; s2[0][12] = 4'd12; s2[0][13] = 4'd0; s2[0][14] = 4'd5; s2[0][15] = 4'd10; 
s2[1][0] = 4'd3; s2[1][1] = 4'd13; s2[1][2] = 4'd4; s2[1][3] = 4'd7; s2[1][4] = 4'd15; s2[1][5] = 4'd2; s2[1][6] = 4'd8; s2[1][7] = 4'd14; s2[1][8] = 4'd12; s2[1][9] = 4'd0; s2[1][10] = 4'd1; s2[1][11] = 4'd10; s2[1][12] = 4'd6; s2[1][13] = 4'd9; s2[1][14] = 4'd11; s2[1][15] = 4'd5; 
s2[2][0] = 4'd0; s2[2][1] = 4'd14; s2[2][2] = 4'd7; s2[2][3] = 4'd11; s2[2][4] = 4'd10; s2[2][5] = 4'd4; s2[2][6] = 4'd13; s2[2][7] = 4'd1; s2[2][8] = 4'd5; s2[2][9] = 4'd8; s2[2][10] = 4'd12; s2[2][11] = 4'd6; s2[2][12] = 4'd9; s2[2][13] = 4'd3; s2[2][14] = 4'd2; s2[2][15] = 4'd15; 
s2[3][0] = 4'd13; s2[3][1] = 4'd8; s2[3][2] = 4'd10; s2[3][3] = 4'd1; s2[3][4] = 4'd3; s2[3][5] = 4'd15; s2[3][6] = 4'd4; s2[3][7] = 4'd2; s2[3][8] = 4'd11; s2[3][9] = 4'd6; s2[3][10] = 4'd7; s2[3][11] = 4'd12; s2[3][12] = 4'd0; s2[3][13] = 4'd5; s2[3][14] = 4'd14; s2[3][15] = 4'd9;

s3[0][0] = 4'd10; s3[0][1] = 4'd0; s3[0][2] = 4'd9; s3[0][3] = 4'd14; s3[0][4] = 4'd6; s3[0][5] = 4'd3; s3[0][6] = 4'd15; s3[0][7] = 4'd5; s3[0][8] = 4'd1; s3[0][9] = 4'd13; s3[0][10] = 4'd12; s3[0][11] = 4'd7; s3[0][12] = 4'd11; s3[0][13] = 4'd4; s3[0][14] = 4'd2; s3[0][15] = 4'd8; 
s3[1][0] = 4'd13; s3[1][1] = 4'd7; s3[1][2] = 4'd0; s3[1][3] = 4'd9; s3[1][4] = 4'd3; s3[1][5] = 4'd4; s3[1][6] = 4'd6; s3[1][7] = 4'd10; s3[1][8] = 4'd2; s3[1][9] = 4'd8; s3[1][10] = 4'd5; s3[1][11] = 4'd14; s3[1][12] = 4'd12; s3[1][13] = 4'd11; s3[1][14] = 4'd15; s3[1][15] = 4'd1; 
s3[2][0] = 4'd13; s3[2][1] = 4'd6; s3[2][2] = 4'd4; s3[2][3] = 4'd9; s3[2][4] = 4'd8; s3[2][5] = 4'd15; s3[2][6] = 4'd3; s3[2][7] = 4'd0; s3[2][8] = 4'd11; s3[2][9] = 4'd1; s3[2][10] = 4'd2; s3[2][11] = 4'd12; s3[2][12] = 4'd5; s3[2][13] = 4'd10; s3[2][14] = 4'd14; s3[2][15] = 4'd7; 
s3[3][0] = 4'd1; s3[3][1] = 4'd10; s3[3][2] = 4'd13; s3[3][3] = 4'd0; s3[3][4] = 4'd6; s3[3][5] = 4'd9; s3[3][6] = 4'd8; s3[3][7] = 4'd7; s3[3][8] = 4'd4; s3[3][9] = 4'd15; s3[3][10] = 4'd14; s3[3][11] = 4'd3; s3[3][12] = 4'd11; s3[3][13] = 4'd5; s3[3][14] = 4'd2; s3[3][15] = 4'd12;

s4[0][0] = 4'd7; s4[0][1] = 4'd13; s4[0][2] = 4'd14; s4[0][3] = 4'd3; s4[0][4] = 4'd0; s4[0][5] = 4'd6; s4[0][6] = 4'd9; s4[0][7] = 4'd10; s4[0][8] = 4'd1; s4[0][9] = 4'd2; s4[0][10] = 4'd8; s4[0][11] = 4'd5; s4[0][12] = 4'd11; s4[0][13] = 4'd12; s4[0][14] = 4'd4; s4[0][15] = 4'd15; 
s4[1][0] = 4'd13; s4[1][1] = 4'd8; s4[1][2] = 4'd11; s4[1][3] = 4'd5; s4[1][4] = 4'd6; s4[1][5] = 4'd15; s4[1][6] = 4'd0; s4[1][7] = 4'd3; s4[1][8] = 4'd4; s4[1][9] = 4'd7; s4[1][10] = 4'd2; s4[1][11] = 4'd12; s4[1][12] = 4'd1; s4[1][13] = 4'd10; s4[1][14] = 4'd14; s4[1][15] = 4'd9; 
s4[2][0] = 4'd10; s4[2][1] = 4'd6; s4[2][2] = 4'd9; s4[2][3] = 4'd0; s4[2][4] = 4'd12; s4[2][5] = 4'd11; s4[2][6] = 4'd7; s4[2][7] = 4'd13; s4[2][8] = 4'd15; s4[2][9] = 4'd1; s4[2][10] = 4'd3; s4[2][11] = 4'd14; s4[2][12] = 4'd5; s4[2][13] = 4'd2; s4[2][14] = 4'd8; s4[2][15] = 4'd4; 
s4[3][0] = 4'd3; s4[3][1] = 4'd15; s4[3][2] = 4'd0; s4[3][3] = 4'd6; s4[3][4] = 4'd10; s4[3][5] = 4'd1; s4[3][6] = 4'd13; s4[3][7] = 4'd8; s4[3][8] = 4'd9; s4[3][9] = 4'd4; s4[3][10] = 4'd5; s4[3][11] = 4'd11; s4[3][12] = 4'd12; s4[3][13] = 4'd7; s4[3][14] = 4'd2; s4[3][15] = 4'd14;

s5[0][0] = 4'd2; s5[0][1] = 4'd12; s5[0][2] = 4'd4; s5[0][3] = 4'd1; s5[0][4] = 4'd7; s5[0][5] = 4'd10; s5[0][6] = 4'd11; s5[0][7] = 4'd6; s5[0][8] = 4'd8; s5[0][9] = 4'd5; s5[0][10] = 4'd3; s5[0][11] = 4'd15; s5[0][12] = 4'd13; s5[0][13] = 4'd0; s5[0][14] = 4'd14; s5[0][15] = 4'd9; 
s5[1][0] = 4'd14; s5[1][1] = 4'd11; s5[1][2] = 4'd2; s5[1][3] = 4'd12; s5[1][4] = 4'd4; s5[1][5] = 4'd7; s5[1][6] = 4'd13; s5[1][7] = 4'd1; s5[1][8] = 4'd5; s5[1][9] = 4'd0; s5[1][10] = 4'd15; s5[1][11] = 4'd10; s5[1][12] = 4'd3; s5[1][13] = 4'd9; s5[1][14] = 4'd8; s5[1][15] = 4'd6; 
s5[2][0] = 4'd4; s5[2][1] = 4'd2; s5[2][2] = 4'd1; s5[2][3] = 4'd11; s5[2][4] = 4'd10; s5[2][5] = 4'd13; s5[2][6] = 4'd7; s5[2][7] = 4'd8; s5[2][8] = 4'd15; s5[2][9] = 4'd9; s5[2][10] = 4'd12; s5[2][11] = 4'd5; s5[2][12] = 4'd6; s5[2][13] = 4'd3; s5[2][14] = 4'd0; s5[2][15] = 4'd14; 
s5[3][0] = 4'd11; s5[3][1] = 4'd8; s5[3][2] = 4'd12; s5[3][3] = 4'd7; s5[3][4] = 4'd1; s5[3][5] = 4'd14; s5[3][6] = 4'd2; s5[3][7] = 4'd13; s5[3][8] = 4'd6; s5[3][9] = 4'd15; s5[3][10] = 4'd0; s5[3][11] = 4'd9; s5[3][12] = 4'd10; s5[3][13] = 4'd4; s5[3][14] = 4'd5; s5[3][15] = 4'd3;

s6[0][0] = 4'd12; s6[0][1] = 4'd1; s6[0][2] = 4'd10; s6[0][3] = 4'd15; s6[0][4] = 4'd9; s6[0][5] = 4'd2; s6[0][6] = 4'd6; s6[0][7] = 4'd8; s6[0][8] = 4'd0; s6[0][9] = 4'd13; s6[0][10] = 4'd3; s6[0][11] = 4'd4; s6[0][12] = 4'd14; s6[0][13] = 4'd7; s6[0][14] = 4'd5; s6[0][15] = 4'd11; 
s6[1][0] = 4'd10; s6[1][1] = 4'd15; s6[1][2] = 4'd4; s6[1][3] = 4'd2; s6[1][4] = 4'd7; s6[1][5] = 4'd12; s6[1][6] = 4'd9; s6[1][7] = 4'd5; s6[1][8] = 4'd6; s6[1][9] = 4'd1; s6[1][10] = 4'd13; s6[1][11] = 4'd14; s6[1][12] = 4'd0; s6[1][13] = 4'd11; s6[1][14] = 4'd3; s6[1][15] = 4'd8; 
s6[2][0] = 4'd9; s6[2][1] = 4'd14; s6[2][2] = 4'd15; s6[2][3] = 4'd5; s6[2][4] = 4'd2; s6[2][5] = 4'd8; s6[2][6] = 4'd12; s6[2][7] = 4'd3; s6[2][8] = 4'd7; s6[2][9] = 4'd0; s6[2][10] = 4'd4; s6[2][11] = 4'd10; s6[2][12] = 4'd1; s6[2][13] = 4'd13; s6[2][14] = 4'd11; s6[2][15] = 4'd6; 
s6[3][0] = 4'd4; s6[3][1] = 4'd3; s6[3][2] = 4'd2; s6[3][3] = 4'd12; s6[3][4] = 4'd9; s6[3][5] = 4'd5; s6[3][6] = 4'd15; s6[3][7] = 4'd10; s6[3][8] = 4'd11; s6[3][9] = 4'd14; s6[3][10] = 4'd1; s6[3][11] = 4'd7; s6[3][12] = 4'd6; s6[3][13] = 4'd0; s6[3][14] = 4'd8; s6[3][15] = 4'd13;

s7[0][0] = 4'd4; s7[0][1] = 4'd11; s7[0][2] = 4'd2; s7[0][3] = 4'd14; s7[0][4] = 4'd15; s7[0][5] = 4'd0; s7[0][6] = 4'd8; s7[0][7] = 4'd13; s7[0][8] = 4'd3; s7[0][9] = 4'd12; s7[0][10] = 4'd9; s7[0][11] = 4'd7; s7[0][12] = 4'd5; s7[0][13] = 4'd10; s7[0][14] = 4'd6; s7[0][15] = 4'd1; 
s7[1][0] = 4'd13; s7[1][1] = 4'd0; s7[1][2] = 4'd11; s7[1][3] = 4'd7; s7[1][4] = 4'd4; s7[1][5] = 4'd9; s7[1][6] = 4'd1; s7[1][7] = 4'd10; s7[1][8] = 4'd14; s7[1][9] = 4'd3; s7[1][10] = 4'd5; s7[1][11] = 4'd12; s7[1][12] = 4'd2; s7[1][13] = 4'd15; s7[1][14] = 4'd8; s7[1][15] = 4'd6; 
s7[2][0] = 4'd1; s7[2][1] = 4'd4; s7[2][2] = 4'd11; s7[2][3] = 4'd13; s7[2][4] = 4'd12; s7[2][5] = 4'd3; s7[2][6] = 4'd7; s7[2][7] = 4'd14; s7[2][8] = 4'd10; s7[2][9] = 4'd15; s7[2][10] = 4'd6; s7[2][11] = 4'd8; s7[2][12] = 4'd0; s7[2][13] = 4'd5; s7[2][14] = 4'd9; s7[2][15] = 4'd2; 
s7[3][0] = 4'd6; s7[3][1] = 4'd11; s7[3][2] = 4'd13; s7[3][3] = 4'd8; s7[3][4] = 4'd1; s7[3][5] = 4'd4; s7[3][6] = 4'd10; s7[3][7] = 4'd7; s7[3][8] = 4'd9; s7[3][9] = 4'd5; s7[3][10] = 4'd0; s7[3][11] = 4'd15; s7[3][12] = 4'd14; s7[3][13] = 4'd2; s7[3][14] = 4'd3; s7[3][15] = 4'd12;

s8[0][0] = 4'd13; s8[0][1] = 4'd2; s8[0][2] = 4'd8; s8[0][3] = 4'd4; s8[0][4] = 4'd6; s8[0][5] = 4'd15; s8[0][6] = 4'd11; s8[0][7] = 4'd1; s8[0][8] = 4'd10; s8[0][9] = 4'd9; s8[0][10] = 4'd3; s8[0][11] = 4'd14; s8[0][12] = 4'd5; s8[0][13] = 4'd0; s8[0][14] = 4'd12; s8[0][15] = 4'd7; 
s8[1][0] = 4'd1; s8[1][1] = 4'd15; s8[1][2] = 4'd13; s8[1][3] = 4'd8; s8[1][4] = 4'd10; s8[1][5] = 4'd3; s8[1][6] = 4'd7; s8[1][7] = 4'd4; s8[1][8] = 4'd12; s8[1][9] = 4'd5; s8[1][10] = 4'd6; s8[1][11] = 4'd11; s8[1][12] = 4'd0; s8[1][13] = 4'd14; s8[1][14] = 4'd9; s8[1][15] = 4'd2; 
s8[2][0] = 4'd7; s8[2][1] = 4'd11; s8[2][2] = 4'd4; s8[2][3] = 4'd1; s8[2][4] = 4'd9; s8[2][5] = 4'd12; s8[2][6] = 4'd14; s8[2][7] = 4'd2; s8[2][8] = 4'd0; s8[2][9] = 4'd6; s8[2][10] = 4'd10; s8[2][11] = 4'd13; s8[2][12] = 4'd15; s8[2][13] = 4'd3; s8[2][14] = 4'd5; s8[2][15] = 4'd8; 
s8[3][0] = 4'd2; s8[3][1] = 4'd1; s8[3][2] = 4'd14; s8[3][3] = 4'd7; s8[3][4] = 4'd4; s8[3][5] = 4'd10; s8[3][6] = 4'd8; s8[3][7] = 4'd13; s8[3][8] = 4'd15; s8[3][9] = 4'd12; s8[3][10] = 4'd9; s8[3][11] = 4'd0; s8[3][12] = 4'd3; s8[3][13] = 4'd5; s8[3][14] = 4'd6; s8[3][15] = 4'd11;

end

    assign ext[0] = {in[0], in[5]};
    assign ext[1] = {in[6], in[11]};
    assign ext[2] = {in[12], in[17]};
    assign ext[3] ={in[18], in[23]};
    assign ext[4] ={in[24], in[29]};
    assign ext[5] ={in[30], in[35]};
    assign ext[6] ={in[36], in[41]};
    assign ext[7] ={in[42], in[47]};

    assign mid[0] = in[1:4];
    assign mid[1] = in[7:10];
    assign mid[2] = in[13:16];
    assign mid[3] = in[19:22];
    assign mid[4] = in[25:28];
    assign mid[5] = in[31:34];
    assign mid[6] = in[37:40];
    assign mid[7] = in[43:46];

    assign out[0:3] = s1[ext[0]][mid[0]];
    assign out[4:7] = s2[ext[1]][mid[1]];
    assign out[8:11] = s3[ext[2]][mid[2]];
    assign out[12:15] = s4[ext[3]][mid[3]];
    assign out[16:19] = s5[ext[4]][mid[4]];
    assign out[20:23] = s6[ext[5]][mid[5]];
    assign out[24:27] = s7[ext[6]][mid[6]];
    assign out[28:31] = s8[ext[7]][mid[7]];

endmodule

//------------------------------------////------------------------------------////------------------------------------////------------------------------------//


//------------------------------------////------------------------------------////------------------------------------////------------------------------------//

module tb();

reg[0:63] i = 64'b0000001001110001101101001000111100000100111000100001000100111111 ;
reg[0:47] k = 48'b001011010010100101001010010010100100100100101001 ;
wire[0:63] ans, fans;
wire[0:63] plain, ipplain;
wire[0:31]  rig, lef, 
            cip, 
            cipfin, cipfin1;
wire[0:47] ex, sin, ex1, key ;

assign plain = i;
assign key = k;

initialperm ip(.in(plain), .out(ipplain));

assign rig = ipplain[32:63]; 
assign lef = ipplain[0:31];

expand expa(.in(rig), .out(ex));
keyXor xo(.in(ex), .key(key), .out(ex1));
sboxes sbo(.in(ex1), .out(cip));
inboxperm inbo(.in(cip), .out(cipfin));

assign cipfin1 = lef ^ cipfin;
assign ans = {cipfin1, rig};

finalperm fp(.in(ans), .out(fans));

initial begin
    #10;
    $display("Cipher Text - %b\nPlain Text - %b",fans,plain) ;
end

endmodule