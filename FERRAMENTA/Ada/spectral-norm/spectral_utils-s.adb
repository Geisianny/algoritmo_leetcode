pragma Source_Reference (000240, "spectralnorm.gnat-4.gnat");

with Division.S;
package body Spectral_Utils.S is

   use type Real;
   use Division.S;

   subtype A_Element_Pair is SSE_Vector;

   --  A is the matrix. Evaluate matrix A at (I,J):

   function Eval_A (I, J : in Matrix_Index) return Real is
      Denom : constant Real := Real (((I + J) * (I + J + 1)) / 2 + I + 1);
   begin
      return 1.0 / Denom;
   end Eval_A;

   function Eval_A_tr_Twice (I, J : in Matrix_Index) return A_Element_Pair is
      Denoms : constant A_Element_Pair:=
        (Real (((I + J    )*(I + J + 1))/2 + J + 1),
         Real (((I + J + 1)*(I + J + 2))/2 + J + 2));
   begin
      return (1.0, 1.0) / Denoms;
   end Eval_A_tr_Twice;

   function Eval_A_Twice (I, J : in Matrix_Index) return A_Element_Pair is
      Denoms : constant A_Element_Pair :=
        (Real (((I + J    )*(I + J + 1))/2 + I + 1),
         Real (((I + J + 1)*(I + J + 2))/2 + I + 1));
   begin
      return (1.0, 1.0) / Denoms;
   end Eval_A_Twice;

   Half_Matrix_Size : constant Matrix_Index := Matrix_Size / 2;

   overriding
   procedure Eval_A_Times
     (Iron          : in     Forced;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      Au            :    out Matrix)
   is
      J_Index : Matrix_Index;
      Elements : array (Matrix_Index range 0 .. Matrix_Size / 2) of SSE_Vector;
      Sums : SSE_Vector;
   begin
      for I in Start .. Finish loop
         Sums := (0.0, 0.0);
         for J in Matrix_Index range 0 .. Half_Matrix_Size - 1 loop
            J_Index      := U'First + 2*J;
            Elements (J) := Eval_A_Twice (I, J_Index);
         end loop;
         for J in Matrix_Index range 0 .. Half_Matrix_Size - 1 loop
            J_Index      := U'First + 2*J;
            Sums := Sums + Elements(J) * (U(J_Index), U(J_Index+1));
         end loop;
         if Matrix_Size mod 2 = 1 then
            Sums(0) := Sums(0) + Eval_A(I, U'Last) * U(U'Last); -- J_Index := U'Last;
         end if;
         Au(I) := Sums(0) + Sums(1);
      end loop;
   end Eval_A_Times;

   overriding
   procedure Eval_At_Times
     (Iron          : in     Forced;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      Au            :    out Matrix)
   is
      J_Index : Matrix_Index;
      Elements : array (Matrix_Index range 0 .. Matrix_Size / 2) of SSE_Vector;
      Sums : SSE_Vector;
   begin
      for I in Start .. Finish loop
         Sums := (0.0, 0.0);
         for J in Matrix_Index range 0 .. Half_Matrix_Size - 1 loop
            J_Index     := U'First + 2*J;
            Elements(J) := Eval_A_tr_Twice (I, J_Index);
         end loop;
         for J in Matrix_Index range 0 .. Half_Matrix_Size - 1 loop
            J_Index     := U'First + 2*J;
            Sums := Sums + Elements(J) * (U(J_Index), U(J_Index+1));
         end loop;
         if Matrix_Size mod 2 = 1 then
            Sums(0) := Sums(0) + Eval_A (U'Last, I) * U(U'Last); -- J_Index := U'Last;
         end if;
         Au(I) := Sums(0) + Sums(1);
      end loop;
   end Eval_At_Times;

end Spectral_Utils.S;
