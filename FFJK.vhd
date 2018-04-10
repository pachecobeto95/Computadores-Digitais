Entity FFJK is port (j, k, clk : in bit;
                        q, nq : out bit
                );
end FFJK;

Architecture FLUXO of FFJK is 

signal qt : bit;

begin
  
  qt <= '0' when (clk'Event) and (clk = '1') and (j = '0') and (k = '1') else
        '1' when (clk'Event) and (clk = '1') and (j = '1') and (k = '0') else
        not qt when (clk'Event) and (clk = '1') and (j = '1') and (k = '1');
  q <= qt;
  nq <= not qt;  
end FLUXO;