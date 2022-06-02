/*
  Name : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Control Gate verilog 
*/

module pass (
			clk,
  			rst,
  			tx,
  			dataIn,
  			controlOut
);
  
  input clk;
  input rst;
  input [31:0] dataIn;
  output reg [2:0] controlOut; // 001: Stop , 010 : Go high , 100 : Go low
  
  integer state ; // state machine
  integer count; // counter 
  
  always @ (posedgec clk)
    begin
      if (rst)
        begin
          state <= 0;
          count <= 0;
          controlOut <= 001;
        end
      else
        begin
          count <= count + 1;
          case (state)
            0:
              begin
                count <= 0;
                if (tx && dataIn == 32'd1)
                  begin
                    state <= 1;
                  end 
                else if ( tx && dataIn == 32'd2)
                  begin
                    state <= 1;
                  end 
                else
                  begin
                    state <= 0;
                  end 
              end 
            1:
              begin
                if (counter < 5)
                  begin
                    state <= 1
                  end 
                else
                  begin
                    state <= 2;
                    counter <= 0;
                  end 
              end 
            2:
              begin
                if (counter < 5)
                  begin
                    state <= 2;
                  end 
                else
                  begin
                    state <= 0;
                  end 
              end 
              
          endcase
        end 
    end 
  
  always @ (negedge clk)
    begin
      case (state)
        0:
          begin
            controlOut <= 3'b001;
          end
        1:
          begin
            controlOut <= 3'b010;
          end 
        2:
          begin
            controlOut <= 3'b100;
          end 
      endcase
    end 
endmodule 

/*
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2022 07:35:08 PM
// Design Name: 
// Module Name: tbtest
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tbtest(

    );
  reg clk;
  reg rst;
  reg [5:0] identity;
  wire  [3:0] pass;   
    Pass uut (
  		     clk,
  			 rst ,
  			 identity,
  		     pass
			);
  initial
    begin
      clk = 0;
      rst = 1;
      identity = 6'd1;
      #10
      rst = 0;
    end
    
  always
    begin
      #5 clk = ! clk;
    end 

endmodule

*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
		  module pass (
			clk,
  			rst,
  			tx,
  			dataIn,
  			controlOut
);
  
  input clk;
  input rst;
  input tx;
  input [31:0] dataIn;
  output reg [2:0] controlOut; // 001: Stop , 010 : Go high , 100 : Go low
  
  integer state ; // state machine
  integer count; // counter 
  
  always @ (posedge clk)
    begin
      if (rst)
        begin
          state <= 0;
          count <= 0;
          controlOut <= 001;
        end
      else
        begin
          count <= count + 1;
          case (state)
            0:
              begin
                count <= 0;
                if (tx && dataIn == 32'd1)
                  begin
                    state <= 1;
                  end 
                else if ( tx && dataIn == 32'd2)
                  begin
                    state <= 1;
                  end 
                else
                  begin
                    state <= 0;
                  end 
              end 
            1:
              begin
                if (count < 5)
                  begin
                    state <= 1;
                  end 
                else
                  begin
                    state <= 2;
                    count <= 0;
                  end 
              end 
            2:
              begin
                if (count < 5)
                  begin
                    state <= 2;
                  end 
                else
                  begin
                    state <= 0;
                  end 
              end 
              
          endcase
        end 
    end 
  
  always @ (negedge clk)
    begin
      case (state)
        0:
          begin
            controlOut <= 3'b001;
          end
        1:
          begin
            controlOut <= 3'b010;
          end 
        2:
          begin
            controlOut <= 3'b100;
          end 
      endcase
    end 
endmodule 


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2022 07:35:08 PM
// Design Name: 
// Module Name: tbtest
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tbtest(

    );
  
  reg clk;
  reg rst;
  reg tx;
  reg [31:0] dataIn;
  wire  [2:0] controlOut; // 001: Stop , 010 : Go high , 100 : Go low
  
  pass dut (
			clk,
  			rst,
  			tx,
  			dataIn,
  			controlOut
);
  

  initial
    begin
      clk = 0;
      rst = 1;
      tx = 1;
      dataIn = 32'd1;
      #10
      rst = 0;
    end
    
  always
    begin
      #5 clk = ! clk;
    end 

endmodule

*/
		  
