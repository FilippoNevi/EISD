`timescale 1ns / 1ps

module mult(
	input clk,
	input rst, 
	input din_rdy,
	input din_1,
	input din_2,
	input din_3,
	input din_4,
	output dout_rdy,
	output dout_1,
	output dout_2,
	output dout_3,
	output dout_4
	);

wire clk, rst, din_rdy, dout_rdy;
reg done;
wire[7:0] din_1, din_2, din_3, din_4;
wire[7:0] dout_1, dout_2, dout_3, dout_4;
reg[31:0] Product, Number_A, Number_B, Counter;
reg[2:0] STATE, NEXT_STATE;

parameter Reset_ST = 0;
parameter ST_0=1, ST_1=2, ST_2=3, ST_3=4, ST_4=5, ST_5=6;

assign dout_rdy = done;
assign dout_1 = Product[31:24];
assign dout_2 = Product[23:16];
assign dout_3 = Product[15:8];
assign dout_4 = Product[7:0];

always@(STATE, din_rdy, Counter)
begin
	case (STATE)

		Reset_ST: begin
			NEXT_STATE <= ST_0;
		end

		ST_0: begin
			if (din_rdy == 1'b1)
				NEXT_STATE <= ST_1;
			else
				NEXT_STATE <= ST_0;
		end

		ST_1: begin
			NEXT_STATE <= ST_2;
		end

		ST_2: begin
			if (Number_B[0] == 1'b1)
				NEXT_STATE <= ST_3;
			else
				NEXT_STATE <= ST_4;
		end

		ST_3: begin
			NEXT_STATE <= ST_4;
		end

		ST_4: begin
			if (Counter > 1'b0)
				NEXT_STATE <= ST_2;
			else
				NEXT_STATE <= ST_5;
		end

		ST_5: begin
			NEXT_STATE <= ST_0;
		end

		default: begin
			NEXT_STATE <= STATE;
		end
	endcase
end

always @(posedge clk, negedge rst)
begin
	if (rst == 1'b0) begin
		STATE <= Reset_ST;
	end
	else begin
		STATE <= NEXT_STATE;
		case (NEXT_STATE)

			Reset_ST: begin
				done <= 1'b0;
				Number_A <= 32'b0;
				Number_B <= 32'b0;
				Counter <= 32'b0;
				Product <= 32'b0;
			end

			ST_0: begin
				done <= 1'b0;
				Number_A <= 32'b0;
				Number_B <= 32'b0;
				Counter <= 32'b0;
				Product <= 32'b0;
			end

			ST_1: begin
				Number_A[15:8] <= din_1;
				Number_A[7:0] <= din_2;
				Counter[15:8] <= din_1;
				Counter[7:0] <= din_2;
				Number_B[15:8] <= din_3;
				Number_B[7:0] <= din_4;
			end

			ST_2: begin
			end

			ST_3: begin
				Product <= Product + Number_A;
			end

			ST_4: begin
				Number_A <= Number_A << 1;
				Number_B <= Number_B >> 1;
				Counter <= Counter >> 1;
			end

			ST_5: begin
				dout_1 <= Product[31:24];
				dout_2 <= Product[23:16];
				dout_3 <= Product[15:8];
				dout_4 <= Product[7:0];
			end

			default: begin
			end
		endcase
	end
end
endmodule