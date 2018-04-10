Entity CONTADOR_4_MAQUINA is port(x, clk : in bit;
                                   z : out bit
                            );
End CONTADOR_4_MAQUINA;



Architecture Comportamental of CONTADOR_4_MAQUINA is
Type estado is (cont0, cont1, cont2, cont3, cont4); 

signal atual : estado := cont0;

Begin

Saida : Process(atual)

Begin
 if(atual = cont4) then
  z <= '1';
else
  z <= '0';
end if; 
End Process;

Transition : Process(clk)

Begin
  
  if (clk'Event) and (clk = '1') then
   
   case atual is
     
   when cont0 => if (x = '1') then
              	     atual <= cont1;
            	    else
            	       atual <= cont0;
          	      end if; 
          	    
   when cont1 => if (x = '1') then
              	     atual <= cont1;
          	     else
            	       atual <= cont0;
         	      end if;
          	          	        
   when cont2 => if (x = '1') then
              	     atual <= cont1;
          	      else
            	       atual <= cont0;
          	      end if;
    when cont3 => if (x = '1') then
              	     atual <= cont1;
            	     else
            	       atual <= cont0;
          	       end if;  
          	       
          	       
   	when cont4 => if (x = '1') then
              	     atual <= cont0;
        	         else
            	       atual <= cont0;
          	       end if;       	    
     
    
    
   end case; 
  end if; 
  
End Process;



End Comportamental;                           
