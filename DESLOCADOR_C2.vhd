Entity DESLOCADOR_C2 is port(x : in bit_vector(3 downto 0);
                              sh0, sh1 : in bit;
                              q : out bit_vector(3 downto 0)
                    );
End DESLOCADOR_C2;
                    
Architecture FLUXO of DESLOCADOR_C2 is 


Begin
  
  q(0) <= '0' when (sh0 = '0') and (sh1 = '1') else
           x(1) when (sh0 = '1') and (sh1 = '0') else
           x(0);
           
  q(1) <= x(0) when (sh0 = '0') and (sh1 = '1') else
          x(2) when (sh0 = '1') and (sh1 = '0') else
          x(1);
          
  q(2) <= x(1) when (sh0 = '0') and (sh1 = '1') else
          x(3) when (sh0 = '1') and (sh1 = '0') else
          x(2);
          
  q(3) <= x(2) when (sh0 = '0') and (sh1 = '1') else
          '1' when (sh0 = '1') and (sh1 = '0') else
          x(3);                    

End FLUXO;