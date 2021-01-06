//-- mpres.v
module mpres(input clk_in, output D1, output D2, output D3, output D4);
wire clk_in;
wire D1;
wire D2;
wire D3;

    
//-- Parametros del componente
//-- Bits para los diferentes prescalers
//-- Cambiar estos valores segun la secuencia a sacar por los leds
parameter N0 = 25;  //-- Prescaler base
parameter N1 = 1;
parameter N2 = 2;
parameter N3 = 3;

    
//-- Cable con señal de reloj base: la salida del prescaler 0
wire clk_base;
    
//-- Prescaler base. Conectado a la señal de reloj de entrada
//-- Su salida es por clk_base
//-- Tiene N0 bits de tamaño
prescaler #(.N(N0))  
  Pres0(
   .clk_in(clk_in),
   .clk_out(clk_base)
  );
    
//-- Canal 1: Prescaner de N1 bits, conectado a led 1
prescaler #(.N(N1))
  Pres1(
    .clk_in(clk_base),
    .clk_out(D1)
  );
    
//-- Canal 2: Prescaler de N2 bits, conectado a led 2
prescaler #(.N(N2))
  Pres2(
    .clk_in(clk_base),
    .clk_out(D2)
  );
    
//-- Canal 3: Prescaler de N3 bits, conectado a led 3
prescaler #(.N(N3))
  Pres3(
    .clk_in(clk_base),
    .clk_out(D3)
  );
    
 
endmodule