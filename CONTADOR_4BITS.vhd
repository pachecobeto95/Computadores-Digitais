Entity CONTADOR_4BITS is port(clk : in bit;
            	                   q : out bit_vector(3 downto 0)
    	                   );
End CONTADOR_4BITS;

Architecture Hybrid of CONTADOR_4BITS is 

Component FFJK 
  port (j, k, clk : in bit;
                        q, nq : out bit
                );
End Component;

signal j2, j3 : bit;
signal qt : bit_vector(3 downto 0);

Begin
  
  FFJK0 : FFJK port map('1', '1', clk, qt(0));
  FFJK1 : FFJK port map(qt(0), qt(0), clk, qt(1));
  j2 <= qt(0) and qt(1);
  FFJK2 : FFJK port map(j2, j2, clk, qt(2));
  j3 <= j2 and qt(2); 
  FFJK3 : FFJK port map(j3, j3, clk, qt(3)); 
  q <= qt;  
    
  
  
  
  
End Hybrid;
          
