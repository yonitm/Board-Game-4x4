# Project Description
This project contains an implementation via Logisim and my conversion to Verilog HDL.
This is a board game in which the player collects prizes over a board in size 4x4.

Each cell on the board is represented by an ordered pair (y,x), (y and x get values in the range [0,3]). In the beginning of the game, each cell contains a prize defined by prize(y,x)=y+x.
The starting point of the player is (0,0).
At  every clock cycle, the player moves in one of 4 directions: north (00), south (01), west (10) or east (11). Note that the player earns the prize in the cell only when visiting it for the ***first time***.

At each clock cycle, the player gives an input (00, 01, 10 or 11) that determines the direction of the path's progress.
The cells are represented by 4 bits each that are a concatenation of {y,x}.
When finding which is the next cell to visit, the prize being calculated as described above: x+y for first visit, 0 else.

 Note that in the Verilog HDL implementation, the game can be reset by using the "reset" signal.

# Project Files
**Verilog HDL** 
- [board game.sv](https://github.com/yonitm/Board-Game-4x4/blob/main/board%20game.sv) the design file 
- [board game (cells).sv](https://github.com/yonitm/Board-Game-4x4/blob/main/board%20game%20(cells).sv) the design file with indication when the cell becomes "visited"
- [board game_TB.sv](https://github.com/yonitm/Board-Game-4x4/blob/main/board%20game_TB.sv) the test bench file (for both the regular and the cells versions)
- [board game_waveform.png](https://github.com/yonitm/Board-Game-4x4/blob/main/board%20game_waveform.png) the test bench waveform screenshot for "board game.sv"
- [board game (cells)_waveform.png](https://github.com/yonitm/Board-Game-4x4/blob/main/board%20game%20(cells)_waveform.png) the test bench waveform screenshot for "board game (cells).sv"

**Logisim**
- [board game 4x4.circ](https://github.com/yonitm/Board-Game-4x4/blob/main/board%20game%204x4.circ) Logisim file
- The images of the modules the circuit is build from:
  * [board Logisim.png](https://github.com/yonitm/Board-Game-4x4/blob/main/board%20Logisim.png) 
  * [C_4 Logisim.png](https://github.com/yonitm/Board-Game-4x4/blob/main/C_4%20Logisim.png)
  * [=(4) Logisim.png](https://github.com/yonitm/Board-Game-4x4/blob/main/%3D(4)%20Logisim.png)



