`timescale 1ns / 1ps

module Earned_Prizes_TB;
  
  wire [5:0] earned_TB;
  reg [3:0] prize_TB;
  reg [1:0] direction_TB;
  reg clk_TB, reset_TB;
  reg [3:0] new_place_TB;
  reg [5:0] earned;
  
  
  earned_prizes earned_DUT (.earned(earned_TB), .prize(prize_TB), .clk(clk_TB), .reset(reset_TB), .direction(direction_TB), .new_place(new_place_TB));
  
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
  initial 
    begin
      clk_TB=0;
      forever
        #5 clk_TB = ~clk_TB;
    end
  
  
   initial 
    begin
        reset_TB=1'b0;
    #1  reset_TB=1'b1; 
    end
  
  
  initial
    begin
      direction_TB=2'b11; #10
      direction_TB=2'b01; #10
      direction_TB=2'b10; #10
      direction_TB=2'b00; #10
      direction_TB=2'b11; #10
      direction_TB=2'b01; #10
      direction_TB=2'b00; #10
      direction_TB=2'b00; #10
      
      $finish;
    end

endmodule
