Entity DECODER is port(n0, n1, E : in bit;
                        y : out bit_vector(3 downto 0)
                  );
End DECODER;

Architecture FLUXO of DECODER is
  
Begin
  
  y(0) <= ((not n0) and (not n1)) and (E);
  y(1) <= (n0 and (not n1)) and (E);
  y(2) <= ((not n0) and (n1)) and (E);
  y(3) <= ((n0) and (n1)) and (E);
  
  
End FLUXO;