module my_module(a, b, c, d);
	input a, b;
	output c, d;

	// other stuff
endmodule


// Functions and tasks
module m;
	reg [1:0] r1;
	reg [3:0] r2;
	reg r3;

	always
	begin
		r2 = my_func(r1);		// Invoke function

		my_task(r1, r3);		// Invoke task
	end

	task my_task;
		input [3:0] i;
		output o;
		begin
			// stuff
		end
	endtask

	function [3:0] my_func;
		input [1:0] i;
		begin
			// stuff
			my_func = ...;	// Return value
		end
	endfunction
endmodule