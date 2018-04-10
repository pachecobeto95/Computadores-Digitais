Entity ADD_SUB_C1 is port (x, y : in bit_vector(3 downto 0);
                    	       s : out bit_vector(3 downto 0)
          	         );
End ADD_SUB_C1;

Architecture Hybrid of ADD_SUB_C1 is 
      Component SC
        port (a, b, ci : in bit;
                      s, co : out bit
              );
      End Component;
signal c0, c1, c2, c3 : bit;
Begin

  SC0 : SC port map (x(0), y(0), c3, s(0), c0);
  SC1 : SC port map (x(1), y(1), c0, s(1), c1);
  SC2 : SC port map (x(2), y(2), c1, s(2), c2);
  SC3 : SC port map (x(3), y(3), c2, s(3), c3);  

End Hybrid; 