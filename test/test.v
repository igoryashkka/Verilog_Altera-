module test(output y, 
				input x1,x2,a);
				
	wire wire_a_to_and1,wire_and1_to_or,wire_and2_to_or;
	
	not not_a_to_and1(wire_a_to_and1,a);
	
	and and1(wire_and1_to_or,wire_a_to_and1,x1);
	and and2(wire_and2_to_or,x2,a);
	
	or(y,wire_and1_to_or,wire_and2_to_or);

endmodule

