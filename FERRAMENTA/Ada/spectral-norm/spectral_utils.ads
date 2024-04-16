pragma Source_Reference (000056, "spectralnorm.gnat-4.gnat");

with System;
with Division;

generic
   Matrix_Order : Positive;
package Spectral_Utils is

   subtype Real is Division.SSE_Real;

   type Matrix_Index is mod 2**System.Word_Size;

   Matrix_Size : constant Matrix_Index := Matrix_Index (Matrix_Order);

   type Matrix is array(Matrix_Index range 0 .. Matrix_Size-1) of Real;
   -- Matrix is m_ij = 1 / ((i+j+1)*(i+j))/2 + i + 1); indices start at 0.

   type Matrix_Computation is abstract tagged limited null record;

   function Make_Calculator return Matrix_Computation'Class;
   --  adaptive computations

   --  Get   AU = A * U.   Calculate only AU(Start .. Finish).

   procedure Eval_A_Times
     (Iron          : in     Matrix_Computation;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      AU            :    out Matrix) is abstract;

   --  Get   AU = A_transpose * U.   Calculate only AU(Start .. Finish).

   procedure Eval_At_Times
     (Iron          : in     Matrix_Computation;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      AU            :    out Matrix) is abstract;

end Spectral_Utils;
