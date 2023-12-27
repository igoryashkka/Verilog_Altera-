/////
///
// Verilog 
// Module : 001 
///
///
//To use pins on board - (* chip_pin = "01"*) - before "input" or "output"
///
// Author : igoryashkka 
///
////

module test(output MxNot1y,
			input Mx1A,Mx1X0,Mx1X1,V);

wire Not1Y,Mx1Y, MxQ;

Multiplexer Mx(Mx1Y,Mx1A,Mx1X0,Mx1X1);
DFF DFF1 (.q(MxQ), .d(Mx1Y), .clk(V), .clrn(1'd1), .prn(1'd1));

not (MxNot1y, MxQ);

endmodule
///
//Primitive on Truth table
primitive Multiplexer(output y_wire, 
					  input a_wire, x1_wire,x2_wire);
	table 
	//    a  x1  x2  : y;
	      0  0 	?   : 0;
		  0  1   ?   : 1;
		  1  ?   0   : 0;
		  1  ?   1   : 1;
	endtable 

endprimitive 
///
