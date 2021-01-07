//-- init.v (implementación natural)
//-- Entrada: cable del reloj
//-- Salida: Cable con la señal de inicialización
module init(input wire clk, output wire ini);
    
//-- Cable de entrada el registro de 1 bit
wire din;
    
//-- Salida del registro de 1 bit (inicializado a 0) (solo para simulacion)
//-- En la sintesis siempre estará a 0
reg dout = 0;

//-- Registro genérico: en flanco de subida se captura la entrada
always @(posedge(clk))
  dout <= din;
    
//-- Cablear la entrada a 1
assign din = 0;     // 0 to ligth up green RGB led
    
//-- Conectar la salida del registro a la señal ini
assign ini = dout;
    
endmodule