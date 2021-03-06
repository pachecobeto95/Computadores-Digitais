Entity EXPRESSION is port (a, b, c, d : in bit;
                            r : out bit_vector(1 downto 0)
                  );
End EXPRESSION;

Architecture Hybrid of EXPRESSION is 
  Component MULTIPLICADOR2
    port (x, y : in bit_vector(2 downto 0);
                	               p : out bit_vector(5 downto 0)
      	               );
	 End Component;
	 
	 Component SC
	   port (a, b, ci : in bit;
                      s, co : out bit
              );
    End Component;
    signal rt : bit;
    signal st : bit_vector(1 downto 0);
Begin
  rt <= a and b;
  SC0 : SC port map(c, d, '0', st(0), st(1));
  r(0) <= st(0) and rt;
  r(1) <= st(1) and rt;  

    
    
End Hybrid;  