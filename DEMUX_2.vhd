Entity DEMUX2 is port (x : in bit;
                        sel : in bit_vector(1 downto 0);
                        q : out bit_vector(3 downto 0)
                );
End DEMUX2;

Architecture FLUXO of DEMUX2 is 

BEGIN
  
  q(0) <= (not sel(0) and not sel(1)) and x;
  q(1) <= (sel(0) and not sel(1)) and x;
  q(2) <= (not sel(0) and sel(1)) and x;
  q(3) <= (sel(0) and  sel(1)) and x;
  
End FLUXO;
