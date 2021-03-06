Entity ALU is port (x, y, f0, f1, ci : in bit;
                      co, s : out bit
            );
End ALU;

Architecture Hybrid of ALU is
  Component SC 
    port (a, b, ci : in bit;
                      s, co : out bit
              );
  End Component;
  
  signal s0, s1, s2, s3, s4, c1 : bit;
  
  Begin
    
    s0 <= x and y when (f0 = '0') and (f1 = '0') else
          '0';
    s1 <= x or y when (f0 = '0') and (f1 = '1') else
          '0';
    s2 <= not y when (f0 = '1') and (f1 = '0') else
          '0';
    SC0 : SC port map (x, y, ci, s3, c1);
    
    s4 <= s3 when (f0 = '1') and (f1 = '1') else
          '0';
    co <= c1 when(f0 = '1') and (f1 = '1') else
          '0';
    s <= s0 or s1 or s2 or s4;
                  
    
    
  End Hybrid;
