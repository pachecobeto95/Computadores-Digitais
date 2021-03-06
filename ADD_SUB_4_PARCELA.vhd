Entity ADD_SUB_4_PARCELA is port(x, y, z, w : in bit_vector(3 downto 0);
                                  flag : out bit;
                                  q : out bit_vector(3 downto 0)
                          );
End ADD_SUB_4_PARCELA;



Architecture Hybrid of ADD_SUB_4_PARCELA is 

Component ADD_SUB
  
  port (add_sub : in bit;
                        a, b : in BIT_VECTOR (3 DOWNTO 0 );
                        s : out BIT_VECTOR (3 DOWNTO 0);
                        flag : out bit
                );
  
End Component;

signal qt0, qt1 : bit_vector(3 downto 0);
signal flag_0, flag_1 : bit;

Begin
  
  ADD_SUB_0 : ADD_SUB port map('0', x, y, qt0, flag_0);
  ADD_SUB_1 : ADD_SUB port map('0', z, qt0, qt1, flag_1);
  ADD_SUB_2 : ADD_SUB port map('0', w, qt1, q, flag);  
  
End Hybrid;