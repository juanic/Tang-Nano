//-----------------------------------
//-- Entrada: señal de reloj
//-- Salida: contador de 26 bits
//-----------------------------------
module counter(input clk, output [15:0] data);
wire clk;
    
//-- La salida es un registro de 26 bits, inicializado a 0
reg [15:0] data = 0;
    
//-- Sensible al flanco de subida
always @(posedge clk) begin
  //-- Incrementar el registro
  data <= data + 1;
end
endmodule