Entity CKT_2 is port(x, z, clk : in bit;
                      D : in bit_vector(3 downto 0);
                      q : out bit_vector(3 downto 0);
                      y : out bit
              );
End CKT_2;

Architecture Hybrid of CKT_2 is 

Component FFJK_PR_CLR
  
  port(j, k, clk, pr, clr : in bit;
                            q : out bit
                    );
End Component;

signal qt : bit_vector(3 downto 0);
signal k0, pr0, clr0, pr1, clr1, pr2, clr2, pr3, clr3, k1, k2, k3 : bit;
Begin
  k0 <= not(x);
  pr0 <= not(z) nand D(0);
  clr0 <= (not(z)) nand (not(D(0)));
  FFJK_PR_CLR0 : FFJK_PR_CLR port map(x, k0, clk, pr0, clr0, qt(0));
  
  k1 <= not(qt(0));
  pr1 <= (not(z)) nand (D(1));
  clr1 <= (not(z)) nand (not(D(1)));
  FFJK_PR_CLR1 : FFJK_PR_CLR port map(qt(0), k1, clk, pr1, clr1, qt(1));
 
    
  k2 <= not(qt(1));
  pr2 <= not(z) nand D(2);
  clr2 <= (not(z)) nand (not(D(2)));
  FFJK_PR_CLR2 : FFJK_PR_CLR port map(qt(1), k2, clk, pr2, clr2, qt(2));
    
  k3 <= not(qt(2));
  pr3 <= not(z) nand D(3);
  clr3 <= (not(z)) nand (not(D(3)));
  FFJK_PR_CLR3 : FFJK_PR_CLR port map(qt(2), k3, clk, pr3, clr3, qt(3));  
  q <= qt; 
  y <= qt(3);  
  
  
   
  
  
  
End Hybrid;