pragma Source_Reference (000219, "spectralnorm.gnat-4.gnat");

generic package Spectral_Utils.S is

   type Forced is new Matrix_Computation with null record;
   -- computations use Division.S

   overriding
   procedure Eval_A_Times
     (Iron          : in     Forced;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      AU            :    out Matrix);

   overriding
   procedure Eval_At_Times
     (Iron          : in     Forced;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      AU            :    out Matrix);

end Spectral_Utils.S;
