Entity ALU_2 is port (x, y, f0, f1, ci : in bit;
                      r, co : out bit
              );
              
End ALU_2;

Architecture Hybrid of ALU_2 is 
  Component SC
   port (a, b, ci : in bit;
                      s, co : out bit
    );
  End Component;
  
  signal s, ct : bit;
  
  Begin
  
    r <= x and y when (f0 = '0') and (f1 = '0') else
          x or y when (f0 = '0') and (f1 = '1') else
          not y when (f0 = '1') and (f1 = '0') else
          s;
    SC0 : SC port map(x, y, ci, s, ct);
    co <= ct when(f0 = '1') and (f1 = '1') else
          '0';  
  
  End Hybrid; 
    
