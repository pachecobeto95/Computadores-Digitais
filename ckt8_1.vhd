Entity CKT8_1 is port(x : in bit_vector(3 downto 0);
                      s0, s1 : in bit;
                      y : out bit_vector(3 downto 0)
                );
End CKT8_1;



Architecture Hybrid of CKT8_1 is 
  Component CKT_1
    port (s, in0, in1 : in bit;
                        o : out bit
              );
  End Component;
  
  signal xt : bit_vector(3 downto 0);
  
  Begin
  
  BLOCO_0 : CKT_1 port map (s0, x(0), '0', xt(0));
  BLOCO_1 : CKT_1 port map (s0, x(1), x(0), xt(1));
  BLOCO_2 : CKT_1 port map (s0, x(2), x(1), xt(2));
  BLOCO_3 : CKT_1 port map (s0, x(3), x(2), xt(3));
  
  BLOCO_4 : CKT_1 port map (s1, xt(0), '0', y(0));
  BLOCO_5 : CKT_1 port map (s1, xt(1), '0', y(1));
  BLOCO_6 : CKT_1 port map (s1, xt(2), xt(0), y(2));
  BLOCO_7 : CKT_1 port map (s1, xt(3), xt(1), y(3));  
    
  
  
  
  
End Hybrid; 