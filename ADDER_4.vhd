Entity ADDER_4 is port (x, y : in bit_vector(3 downto 0);
                          s : out bit_vector(3 downto 0)
                  );
End ADDER_4;



Architecture Hybrid of ADDER_4 is 
  Component SC
    port (a, b, ci : in bit;
                      s, co : out bit
              );
  End Component;
  
  Component MS
    port (a, b : in bit;
                      s, c : out bit
    );
  End Component;
signal cy : bit_vector(3 downto 0);

Begin
  
  MS0 : MS port map(x(0), y(0), s(0), cy(0));
  SC0 : SC port map(x(1), y(1), cy(0), s(1), cy(1));
  SC1 : SC port map(x(2), y(2), cy(1), s(2), cy(2));
  SC2 : SC port map(x(3), y(3), cy(2), s(3), cy(3));  
    
End Hybrid;  