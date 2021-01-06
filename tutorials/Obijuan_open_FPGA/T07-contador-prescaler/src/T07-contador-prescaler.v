//-- counter4.v
module counter4(input clk, output [3:0] data);
wire clk;
reg [3:0] data = 0;
    
//-- Parametro para el prescaler
parameter N = 22;
    
//-- Reloj de salida del prescaler
wire clk_pres;
    
//-- Instanciar el prescaler de N bits
prescaler #(.N(N))
  pres1 (
    .clk_in(clk),
    .clk_out(clk_pres)
  );
    
//-- Incrementar el contador en cada flanco de subida
always @(posedge(clk_pres)) begin
  data <= data + 1;
end
    
endmodule