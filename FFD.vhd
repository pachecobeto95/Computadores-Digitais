Entity FFD is port (D, clk : in bit;
                      Q, NQ : out bit
                );
End FFD;

Architecture FLUXO of FFD is 

begin
  Q <= D when (clk'Event) and (clk = '1');
  NQ <= not D when (clk'Event) and (clk = '1');
  
end FLUXO;