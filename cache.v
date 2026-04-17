module cache #(parameter data_w = 8 ,
	           parameter lines = 4 ,
	           parameter tag_w = 6)(
	           input clk , rst , re_en ,
	           input [data_w-1:0] address , data_ram ,
	           output reg hit , read_ram ,
	           output reg [data_w-1:0] data_out ,
	           output reg [data_w-1:0] addr2ram );

reg valid [0:lines-1];
reg [tag_w-1:0] tag_array [0:lines-1];
reg [data_w-1:0] data_array [0:lines-1];

localparam INDEX_W = $clog2(lines);

integer i;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		addr2ram <= 0 ;
		data_out <= 0 ;
		read_ram <= 0 ;
        for (i=0; i<lines; i=i+1) begin
            valid[i] <= 0;
            tag_array[i] <= 0;
            data_array[i] <= 0;
        end
	end

	else if (re_en) begin
	   hit <= 0 ;
       read_ram <= 0 ;
		if (!valid[address[INDEX_W-1:0]] || tag_array[address[INDEX_W-1:0]] != address[data_w-1:2] ) begin
			read_ram <= 1 ;
			addr2ram <= address ;
			data_array[address[INDEX_W-1:0]] <= data_ram ;
			tag_array[address[INDEX_W-1:0]] <= address[data_w-1:2] ;
			valid[address[INDEX_W-1:0]] <= 1 ;

		end
        
        else if (valid[address[INDEX_W-1:0]] && tag_array[address[INDEX_W-1:0]] == address[data_w-1:2]) begin
        	data_out <= data_ram ;
            hit <= 1 ;
            read_ram <= 0 ;
        end
        
	end
end

endmodule
