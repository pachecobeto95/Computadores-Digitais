Entity DEMUX4 is port (E, c0, c1 : in bit;
                        s : out bit_vector(3 downto 0)
              );
End DEMUX4;


Architecture FLUXO of DEMUX4 is 

Begin
  s(0) <= (not(c0) and not(c1)) and E;
  s(1) <= (c0 and not(c1)) and E;
  s(2) <= (not(c0) and c1) and E;
  s(3) <= (c0 and c1) and E;
  
  
End FLUXO;
