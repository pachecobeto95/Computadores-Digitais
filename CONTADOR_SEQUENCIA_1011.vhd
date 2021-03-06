Entity CONTADOR_SEQUENCIA_1011 is port(x, clk : in bit;
           	     	     	               	z_contador : out bit_vector(3 downto 0)
   	     	     	               	  );
   	     	     	               	  
End CONTADOR_SEQUENCIA_1011;


Architecture Hybrid of CONTADOR_SEQUENCIA_1011 is
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

signal z_detector : bit;

Begin

DETECTOR_0 : DETECTOR port map(x, clk, z_detector);
CONTADOR : CONT4 port map(z_detector, z_contador);  






End Hybrid;   	     	     	               	  
