Entity CONT_SEQUENCIA_3 is port(x, clk : in bit;
                                z_detector : out bit;
                                z_contador : out bit_vector(3 downto 0)
                        );
End CONT_SEQUENCIA_3;


Architecture Hybrid of CONT_SEQUENCIA_3 is 

Component DETECTOR
  port(x, clk : in bit;
                          z : out bit
                  );
End Component;

Component CONT4
  port (clk : in bit;
                        q : out BIT_VECTOR (3 DOWNTO 0)
                );
  
End Component;

 signal zt_detector : bit;
    
Begin
  
  DETECTOR_0 : DETECTOR port map(x, clk, zt_detector);
    
  z_detector <= zt_detector;  
  
  CONTADOR : CONT4 port map(zt_detector, z_contador);  



End Hybrid;                                
