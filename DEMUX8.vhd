Entity DEMUX8 is port (E : in bit;
                        c : in bit_vector(2 downto 0);
                        s: out bit_vector(7 downto 0)
                );
End DEMUX8;


Architecture Hybrid of DEMUX8 is 
  Component DEMUX4
    port (E, c0, c1 : in bit;
                        s : out bit_vector(3 downto 0)
              );
  End Component;
  
  signal e0, e1 : bit;
  signal s0, s1 : bit_vector(3 downto 0);
  
  Begin
    
    e0 <= E and (not(c(2)));
    e1 <= E and c(2);
    DEMUX4_0 : DEMUX4 port map(e0, c(0), c(1), s0);
    DEMUX4_1 : DEMUX4 port map(e1, c(0), c(1), s1);
    s(0) <= s0(0);
    s(1) <= s0(1);
    s(2) <= s0(2);
    s(3) <= s0(3);
    s(4) <= s1(0);
    s(5) <= s1(1);
    s(6) <= s1(2);
    s(7) <= s1(3);
      
  
End Hybrid;  