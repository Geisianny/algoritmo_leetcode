pragma Source_Reference (000332, "spectralnorm.gnat-4.gnat");

generic
   Number_Of_Tasks : Positive;
package Spectral_Utils.Dist is

   --  distribute the computation

   pragma Elaborate_Body (Dist);

   --  Get   A_transpose_A_times_U = A_transpose * A * U.

   procedure Eval_Ata_Times_U
     (Iron                  : in     Matrix_Computation'Class;
      U                     : in     Matrix;
      A_transpose_A_times_U :    out Matrix);

private
   No_of_Tasks : constant Matrix_Index := Matrix_Index (Number_Of_Tasks);

   -- Calculate A * U

   task type Matrix_A_times_U is
      pragma Storage_Size (2**18);
      entry Multiply (U : in Matrix; Start, Finish : in Matrix_Index);
      entry Result (Start, Finish : out Matrix_Index; R : out Matrix);
   end Matrix_A_times_U;

   -- Calculate A_transpose * V

   task type Matrix_A_tr_times_V is
      pragma Storage_Size (2**18);
      entry Multiply (V : in Matrix; Start, Finish : in Matrix_Index);
      entry Result (Start, Finish : out Matrix_Index; R : out Matrix);
   end Matrix_A_tr_times_V;

end Spectral_Utils.Dist;
