Entity DESLOCADOR is port (a : in bit_vector(3 downto 0);
                            s : in bit_vector(1 downto 0);
      	                     r : out bit_vector(3 downto 0)
	                   );
End DESLOCADOR;

Architecture Hybrid of DESLOCADOR is 
  Component MUX4
    port (w0, w1, w2, w3 : in bit;
                      sel0, sel1 : in bit;
                      q : out bit
                );
  End Component;
  
Begin
  
  MUX4_0 : MUX4 port map (a(0), a(1), '0', a(0), s(0), s(1), r(0)); 
  MUX4_1 : MUX4 port map (a(1), a(2), a(0), a(1), s(0), s(1), r(1));
  MUX4_2 : MUX4 port map (a(2), a(3), a(1), a(2), s(0), s(1), r(2));
  MUX4_3 : MUX4 port map (a(3), '0', a(2), a(3), s(0), s(1), r(3));  




End Hybrid; 
