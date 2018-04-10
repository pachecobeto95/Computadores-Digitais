Entity AMUX is port(d0, d1 : in bit_vector(3 downto 0);
                    sel : in bit;
                    q : out bit_vector(3 downto 0)
            );
End AMUX;


Architecture Hybrid of AMUX is 

Component MUX2
  
  port (x0, x1 : in bit;
                      sel : in bit;
                      s : out bit
                );
  
End Component;

Begin
  
MUX_0 : MUX2 port map(d0(0), d1(0), sel, q(0));
MUX_1 : MUX2 port map(d0(1), d1(1), sel, q(1));
MUX_2 : MUX2 port map(d0(2), d1(2), sel, q(2));
MUX_3 : MUX2 port map(d0(3), d1(3), sel, q(3));  

End Hybrid;