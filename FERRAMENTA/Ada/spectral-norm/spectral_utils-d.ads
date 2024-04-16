pragma Source_Reference (000113, "spectralnorm.gnat-4.gnat");

generic package Spectral_Utils.D is

   type Vanilla is new Matrix_Computation with null record;
   -- computations use Division.D

   overriding
   procedure Eval_A_Times
     (Iron          : in     Vanilla;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      AU            :    out Matrix);

   overriding
   procedure Eval_At_Times
     (Iron          : in     Vanilla;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      AU            :    out Matrix);

end Spectral_Utils.D;
