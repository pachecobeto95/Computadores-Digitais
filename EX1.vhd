Entity EX1 is port(w, clk : in bit;
                    z : out bit
            );
End EX1;


Architecture Comportamental of EX1 is 
Type estado is (A, B, C);

signal atual : estado := A;
  
Begin

Saida : Process(atual)

Begin
  
  if (atual = C) then
    z <= '1';
  else
    z <= '0';
  end if; 

End Process;

Transition : Process(clk)

Begin
  if (clk'Event) and (clk = '1') then
    
    case atual is 
      
    when A => if (w = '1') then
               atual <= B;
             else
               atual <= A;
             end if;
             
    when B => if (w = '0') then
                atual <= A;
              else
                atual <= C;
              end if; 
              
    when C => if (w = '0') then
               atual <= A;
              else 
               atual <= C;
              end if;                     
    end case;
  end if; 



End Process;



End Comportamental;           
