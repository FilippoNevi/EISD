module fsm(clk, res, inp, outp);
	input clk, res, inp;
	output outp;
	reg [1:0] state;
	reg outp;

	always @(posedge clk, posedge res)
	begin
		if(res)
			state <= 2'b00;
		else
		begin
			case(state)
				2'b00:
				begin
					if(inp) state <= 2'b01;
					else state <= 2'b10;
				end

				2'b01:
				begin
					if(inp) state <= 2'b11;
					else state <= 2'b10;
				end

				2'b10:
				begin
					if(inp) state <= 2'b01;
					else state <= 2'b11;
				end

				2'b11:
				begin
					if(inp) state <= 2'b01;
					else state <= 2'b10;
				end
			endcase
		end
	end

	always @(posedge clk, posedge res)
	begin
		if(rst)
			outp <= 0;
		else if (state == 2'b11)
			outp <= 1;
		else
			outp <= 0;
	end
endmodule