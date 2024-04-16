pragma Source_Reference (000095, "spectralnorm.gnat-4.gnat");

with Spectral_Utils.S, Spectral_Utils.D;

package body Spectral_Utils is

   package Plain is new Spectral_Utils.D;
   package Fancy is new Spectral_Utils.S;

   function Make_Calculator return Matrix_Computation'Class is
   begin
      if System.Word_Size = 64 then
         return Plain.Vanilla'(Matrix_Computation with null record);
      else
         return Fancy.Forced'(Matrix_Computation with null record);
      end if;
   end Make_Calculator;

end Spectral_Utils;
