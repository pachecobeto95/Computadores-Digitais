Entity COMPARADOR is port (x, y : in bit_vector(2 downto 0);
                            r : out bit_vector(3 downto 0);
                            overflow , flag_z0, flag_z1, flag_n: out bit
                    );
End COMPARADOR;

Architecture Hybrid of COMPARADOR is
  Component ADD_SUB
    port (add_sub : in bit;
                        a, b : in BIT_VECTOR (3 DOWNTO 0 );
                        s : out BIT_VECTOR (3 DOWNTO 0);
                        flag : out bit
                );
  End Component;
  
  signal z0, z1, z2 : bit;
  signal xt, yt, rt : bit_vector(3 downto 0);
Begin
  
  z0 <= x(0) xnor y(0);
  z1 <= x(1) xnor y(1);
  z2 <= x(2) xnor y(2);
  flag_z0 <= (z0 and z1) and z2;
  
  xt(0) <= x(0);
  xt(1) <= x(1);
  xt(2) <= x(2);
  xt(3) <= '0';
  
  yt(0) <= y(0);
  yt(1) <= y(1);
  yt(2) <= y(2);
  yt(3) <= '0';
  
  SUB0 : ADD_SUB port map('1', xt, yt, rt, overflow);
  flag_z1 <= ((rt(0) nor rt(1)) nor rt(2))nor rt(3); 
  r <= rt;  
  flag_n <= rt(3);  
    
  
  
  
End Hybrid;
