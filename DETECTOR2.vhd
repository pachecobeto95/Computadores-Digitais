Entity DETECTOR2 is port (x, clk : in bit;
                            z : out bit;
                            r_contador : out bit_vector(3 downto 0)
                        );
End DETECTOR2;


Architecture Comportamental of DETECTOR2 is
  
  Type estado is (reset, tem1, tem10, tem101, tem1011);
    
   Component CONT4
   port (clk : in bit;
                        q : out BIT_VECTOR (3 DOWNTO 0)
                );
   End Component; 
  
  signal atual : estado := reset;
  signal zt : bit;
  
Begin
  
  CONTADOR : CONT4 port map(zt, r_contador);
  
  Saida : Process(atual)
  
  Begin
    
    
    
    if (atual = tem1011) then 
      zt <= '1';
      z <= zt;
    else
      zt <= '0';
      z <= zt;
    end if;
  End Process;
  
  Trasition : Process(clk)
  
  Begin
    
    if (clk'Event) and (clk = '1') then 
      case atual is 
        
      when reset => if (x = '1') then
                     atual <= tem1;
                    end if;
      
      when tem1 => if (x = '0') then
                      atual <= tem10;
                   end if;
                   
      when tem10 => if (x = '0') then
                     atual <= reset;
                   else
                     atual <= tem101;
                   end if;
     when tem101 => if (x = '1') then
                      atual <= tem1011;
                    else
                      atual <= tem10;
                   end if;
    when tem1011 => if (x = '1') then
                     atual <= tem1;
                   else 
                     atual <= tem10;
                  end if; 
     end case;
  end if;                              
    
  End Process;
  
  
  
End Comportamental;  
