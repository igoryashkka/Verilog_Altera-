module test(output y,y_notif0,y_notif1,y_bufif0,y_bufif1,y_mx,
			output [15:0] y_bus,
			input [15:0] in_1, in_2,
			input x1,x2,a,b);
			
	//Multiplexer based on primitives		
	wire wire_a_to_and1,wire_and1_to_or,wire_and2_to_or;
	
	not not_a_to_and1(wire_a_to_and1,a);
	
	and and1(wire_and1_to_or,wire_a_to_and1,x1);
	and and2(wire_and2_to_or,x2,a);
	
	or(y,wire_and1_to_or,wire_and2_to_or);
	
	//Multiplexer based on truth table
	
	Multiplexer mx(y_mx,a,x1,x2);

	// notif
	notif1(y_notif1,a,b);
	notif0(y_notif0,a,b);

	
	// bufif 
	bufif1(y_bufif1,a,b);
	bufif0(y_bufif0,a,b);
	

	//bus

	and and_bus(y_bus, in_1, in_2);

endmodule


primitive Multiplexer(output y, 
					  input a, x1,x2);
	table 
	//    a  x1  x2  : y;
	     0  0 	?   : 0;
		  0  1   ?   : 1;
		  1  ?   0   : 0;
		  1  ?   1   : 1;
	endtable 

endprimitive 

