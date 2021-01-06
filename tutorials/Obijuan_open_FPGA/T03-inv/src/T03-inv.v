//-- inv.v
//-- El componente tiene una entrada (A) y una salida (B)
module inv(input A, output B);
    
//-- Tanto la entrada como la salida son "cables"
wire A;
wire B;
    
  //-- Asignar a la salida la entrada negada
  assign B = ~A;
    
endmodule