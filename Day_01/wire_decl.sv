`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	
    logic A, B;

    assign A = a && b;
    assign B = c && d;
    
    assign out = A || B;
    assign out_n = ~out;
    
endmodule
