Entity Comparador_4bits is port(A, B : in bit_vector(3 downto 0);
                                  n, z, AgtB : out bit
                          );
End Comparador_4bits;

Architecture Hybrid of Comparador_4bits is 
  Component ADD_SUB
    port (add_sub : in bit;
                        a, b : in BIT_VECTOR (3 DOWNTO 0 );
                        s : out BIT_VECTOR (3 DOWNTO 0);
                        flag : out bit
                );
  End Component;
  
  signal r : bit_vector(3 downto 0);
  signal overflow, nt, zt : bit;
  
  Begin
  
    SUB : ADD_SUB port map('1', A, B, r, overflow);
    nt <= r(3);
    zt <= ((r(0) nor r(1)) nor r(2)) nor r(3);
    z <= zt;
    n <= nt;
    AgtB <= nt nor zt;  
  
  
  
End Hybrid;     
