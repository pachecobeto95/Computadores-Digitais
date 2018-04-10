Entity ADD_SUB is port (add_sub : in bit;
                        a, b : in BIT_VECTOR (3 DOWNTO 0 );
                        s : out BIT_VECTOR (3 DOWNTO 0);
                        flag : out bit
                );
end ADD_SUB;

Architecture Hybrid of ADD_SUB is 
    Component SC
      port (a, b, ci : in bit;
                      s, co : out bit
              );
end Component;
signal bt, c : BIT_VECTOR (3 DOWNTO 0);
Begin
  bt(0) <= b(0) xor add_sub;
  bt(1) <= b(1) xor add_sub;
  bt(2) <= b(2) xor add_sub;
  bt(3) <= b(3) xor add_sub;
  SC0 : SC port map (a(0), bt(0), add_sub, s(0), c(0));
  SC1 : SC port map (a(1), bt(1), c(0), s(1), c(1));  
  SC2 : SC port map (a(2), bt(2), c(1), s(2), c(2));
  SC3 : SC port map (a(3), bt(3), c(2), s(3), c(3));
  flag <= c(3) xor c(2);  
    
  
End Hybrid;
  
                        
