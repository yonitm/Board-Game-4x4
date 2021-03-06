`timescale 1ns / 1ps


/*  Board:
   0000 0001 0010 0011
   0100 0101 0110 0111
   1000 1001 1010 1011
   1100 1101 1110 1111
   
*/

// Calculating earned prizes by adding prize in current cell to total sum of earned prizes.
module earned_prizes (output reg [5:0] earned,
                      input wire [3:0] prize,
                      input wire clk,
                      input wire reset,
                      input wire [1:0] direction,
                      input wire [3:0] new_place);
  
  wire [1:0] x;
  wire [1:0] y;
 
  next_place next_place(.new_place(new_place), .x(x), .y(y), .direction(direction),. clk(clk), .reset(reset));
  
  current_prize current_prize(.prize(prize), .new_place(new_place), .x(x), .y(y), .clk(clk), .reset(reset));
  
  always@(negedge reset or prize)
    begin
      if (!reset)
        earned=0; 
      else
        earned<=earned+prize;
    end
  
endmodule
                      
//Finding next cell the player wants to visit.
module next_place (output reg [3:0] new_place,
                   output reg [1:0] x,
                   output reg [1:0] y,
                   input wire [1:0] direction,
                   input wire clk,
                   input wire reset);

  always@(posedge clk or negedge reset)
    begin
      if (!reset)
        begin
          x<=0; 
          y<=0;
          
        end
      else if (direction[1]==0) //direction is vertical
        begin
          y[1:0]<=direction[0]? y+1: y-1;
        end
      else  //direction is horizontal
        x[1:0]<=direction[0]? x+1: x-1;
      
      new_place[3:0]<={y[1:0],x[1:0]};
    end
  
endmodule

// Calculating earned prize in current cell.
module current_prize (output reg [3:0] prize,
                      input wire [3:0] new_place,
                      input wire [1:0] x,
                      input wire [1:0] y,
                      input clk,
                      input reset);
  
  reg [15:0] board;
  
  always@(posedge clk or negedge reset)
    begin 
      if (!reset)
        board<=0;
      else if (board[new_place]==0) //first visit
        begin
       	  prize<=x+y;
          board[new_place]<=1;
        end
      else// visited new_place before
        prize<=0; 
      
    end 
endmodule


  
                      
  