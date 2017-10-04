module filter(input clock,
              input in,
              output reg out,  // out a filtered version of in
              output reg strobe); // true for one cycle synchronous with a change

   parameter freq = 50_000_000; // 50MHz
   parameter limit =    50_000; // 50kHz
   parameter dur = freq / limit;

   parameter N = 14; // INV: 2**N > dur;

	parameter count = 100;
   reg [N:0] countdown;

   // Filter out any meta stability
   reg       in_, in__;

 /*  always @(posedge clock) begin
      strobe <= 0;
      in_ <= in;
      in__ <= in_;
      if (in__ != out)
        countdown <= dur - 1;
        // Note, we depend on countdown[N] being reset here.
      else if (~countdown[N])
        countdown <= countdown - 1;
      else begin
         out <= in__;
         strobe <= 1;
      end
   end
	*/
	reg temp_;
	reg temp__;
	always @(posedge clock)
	begin
		if(in != temp_)
			countdown <= 1000;
		else if(countdown != 0)
			countdown <= countdown -1;
		else
		begin
			out <= temp_;
		end
	
		temp_ <= in;
	end
	endmodule