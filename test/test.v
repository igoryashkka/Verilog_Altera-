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

module test(output y,y_notif0,y_notif1,y_bufif0,y_bufif1,
			output y_mx_1,y_mx_2, 
			output [3:0]y_mxm,
			output [15:0] y_bus,
			input [15:0] in_1, in_2,
			input x1,x2,a,b,
			input [3:0]x1_mxm, x2_mxm, a_mxm);


	///		
	//Multiplexer based on primitives	
	//	
	wire wire_a_to_and1,wire_and1_to_or,wire_and2_to_or;
	
	not not_a_to_and1(wire_a_to_and1,a);
	
	and and1(wire_and1_to_or,wire_a_to_and1,x1);
	and and2(wire_and2_to_or,x2,a);
	
	or(y,wire_and1_to_or,wire_and2_to_or);
	///

	///
	//Multiplexer based on truth table
	//
	//Positionable arguments
	Multiplexer mx_1(y_mx_1,a,x1,x2);
	//Naming-position arguments
	Multiplexer mx_2(.y_wire(y_mx_2), .a_wire(a), .x1_wire(x1), .x2_wire(x2));

	///
	//Multiplexer based on module
	Multiplexer_module mxm_1[3:0](.y(y_mxm),.a(a_mxm),.x1(x1_mxm),.x2(x2_mxm));
	///	

	/// 
	//primitive - notif
	notif1(y_notif1,a,b);
	notif0(y_notif0,a,b);
	// bufif 
	bufif1(y_bufif1,a,b);
	bufif0(y_bufif0,a,b);
	///

	///
	//bus
	and and_bus(y_bus, in_1, in_2);
	///
endmodule

///
//SubModule
module Multiplexer_module(output y,
									input a, x1, x2);

	wire wire_a_to_and1,wire_and1_to_or,wire_and2_to_or;
	
	not not_a_to_and1(wire_a_to_and1,a);
	
	and and1(wire_and1_to_or,wire_a_to_and1,x1);
	and and2(wire_and2_to_or,x2,a);
	
	or(y,wire_and1_to_or,wire_and2_to_or);

	
endmodule 
///



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
