module bitadder(input a,
                      b,
                      cin,
                output s,
                       cout);

assign s = cin ^ (a ^ b);
assign cout = (a&b) | (cin&(a^b));

endmodule