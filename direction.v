module direction
(
	input reg [3:0] btns,
	input reg clk,
	input reg rst,
	output reg [1:0] dir
);

localparam down = 2'b00;
localparam up = 2'b01;
localparam right = 2'b10;
localparam left = 2'b11;

// btn 0 = down
// btn 1 = up
// btn 2 = right
// btn 3 = left

// 00 = down
// 01 = up
// 10 = right
// 11 = left

integer i;
reg [1:0] temp_dir;
initial
begin
	dir[1:0] = right;
	temp_dir[1:0] = right;
end


always @ (posedge clk)
begin

	case (btns)
		4'b0001: begin 
						if(dir[1:0] != up)
						begin
							temp_dir[1:0] = down;
						end
					end
		4'b0010: begin 
						if(dir[1:0] != down)
						begin
							temp_dir[1:0] = up;
						end
					end
		4'b1000: begin
						if(dir[1:0] != right)
						begin
							temp_dir[1:0] = left;
						end
					end
		4'b0100: begin
						if(dir[1:0] != left)
						begin
							temp_dir[1:0] = right;
						end
					end
	endcase	
	dir[1:0] = temp_dir[1:0];
	
	if(rst == 1)
	begin
		dir[1:0] = right;
		temp_dir[1:0] = right;
	end
end

endmodule



module dir_tb;
	reg [3:0] btn_tb;
	wire [1:0] direction_tb;
	
	direction DUT(btn_tb, direction_tb);
	
initial
begin

//	
	
	#100;
	btn_tb = 4'b0000;
	#10 btn_tb = 4'b0001;
	#10 btn_tb = 4'b0010;
	#10 btn_tb = 4'b0011;
	#10 btn_tb = 4'b0100;
	#10 btn_tb = 4'b0101;
	#10 btn_tb = 4'b0110;
	#10 btn_tb = 4'b0111;
	#10 btn_tb = 4'b1000;
	#10 btn_tb = 4'b1001;
	#10 btn_tb = 4'b1010;
	#10 btn_tb = 4'b1011;
	#10 btn_tb = 4'b1100;
	#10 btn_tb = 4'b1101;
	#10 btn_tb = 4'b1110;
	#10 btn_tb = 4'b1111;
	#100;
	
	#10 btn_tb = 4'b0001;
	#10 btn_tb = 4'b0010;
	#10 btn_tb = 4'b0100;
	#10 btn_tb = 4'b1000;
	#10 btn_tb = 4'b0001;
	
	
	
	#10 btn_tb = 4'b0001;
	#10 btn_tb = 4'b0100;
	#10 btn_tb = 4'b0000;
	
end


endmodule