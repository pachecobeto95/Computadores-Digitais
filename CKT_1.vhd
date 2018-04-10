Entity CKT_1 is port (s, in0, in1 : in bit;
                        o : out bit
              );
End CKT_1;

Architecture FLUXO of CKT_1 is 

signal it0, it1 : bit;
Begin

  it0 <= in0 and not(s);
  it1 <= s and in1;
  o <= it0 or it1;
  
End FLUXO;
