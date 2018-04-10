Entity CONT_SEQUENCIA is port(x, clk : in bit;
                               z_cont : out bit;
                               cont_sequencia : out bit_vector(3 downto 0)
                        );
End CONT_SEQUENCIA;



Architecture Comportamental of CONT_SEQUENCIA is
  Type estado is (C0, C1, C2, C3, C4);
    
  Component DETECTOR
    port(x, clk : in bit;
                          z : out bit
                  );
  
  End Component;
  
  
  
  Component ADD_SUB
  port (add_sub : in bit;
                        a, b : in BIT_VECTOR (3 DOWNTO 0 );
                        s : out BIT_VECTOR (3 DOWNTO 0);
                        flag : out bit
                );
  
  End Component; 
  
  Component REGISTER_4BIT
    
    port(d : in bit_vector(3 downto 0);
                              clk : in bit;
                              q : out bit_vector(3 downto 0)
                      );
  End Component;
   
 signal z_detector : bit;   
 signal atual : estado := C0;
 signal r_anterior, cont, d_registrador, q_registrador : bit_vector(3 downto 0);
 signal incremento : bit_vector(3 downto 0); 
   
Begin
  
  incremento(1) <= '0';
  incremento(2) <= '0';
  incremento(3) <= '0';
  
  DETECTOR_0 : DETECTOR port map(x, clk, z_detector);
    
  REGISTRADOR : REGISTER_4BIT port map(d_registrador, clk, q_registrador);  
    
  ADD_SUB_0 : ADD_SUB port map('0', incremento, r_anterior, cont);
    
  Saida : Process(atual)
  
  Begin
    
    if (atual = C4) then
      z_cont <= '1';
      cont_sequencia <= cont;
    else
      z_cont <= '0'; 
    
    end if;
      
    
  End Process;  
  
  Transition : Process(z_detector)
  
  Begin
    
      
      case atual is
        
      when C0 => if (z_detector = '1') then 
        
                    atual <= C1;
      
                    
                  
                 else
                    atual <= C0;
                    
                
                 end if;
                   
       when C1 => if (z_detector = '1') then 
        
                    atual <= C2;
                    
                    
                    
                 else
                    atual <= C1;
                    
                    
                 end if;
       when C2 => if (z_detector = '1') then 
        
                    atual <= C3;
                   
                    
                 else
                    atual <= C2;
                    
                    
                 end if;
       when C3 => if (z_detector = '1') then 
        
                    atual <= C4;
                    
                    
                 else
                    atual <= C3;
                    
                    
                 end if;
       when C4 => if (z_detector = '1') then 
        
                    atual <= C0;
                    
                    
                 else
                    atual <= C4;
                    
                    
                 end if;                               
        
      End case; 
      
      
      
  
    
    
  End Process;  
    


End Comportamental;    
