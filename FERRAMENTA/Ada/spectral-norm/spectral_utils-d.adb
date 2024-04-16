pragma Source_Reference (000134, "spectralnorm.gnat-4.gnat");

with Division.D;

package body Spectral_Utils.D is

   use type Real;
   use Division.D;

   subtype A_Element_Pair is SSE_Vector;

   --  A is the matrix. Evaluate matrix A at (I,J):

   function Eval_A (I, J : in Matrix_Index) return Real is
      Denom : constant Real := Real (((I + J) * (I + J + 1)) / 2 + I + 1);
   begin
      return 1.0 / Denom;
   end Eval_A;

   function Eval_A_tr_Twice (I, J : in Matrix_Index) return A_Element_Pair is
      y0 : constant Real := Real (((I + J    )*(I + J + 1))/2 + J + 1);
      y1 : constant Real := Real (((I + J + 1)*(I + J + 2))/2 + J + 2);
   begin
      return Division.D.Ratios (1.0, 1.0, y0, y1);
   end Eval_A_tr_Twice;

   function Eval_A_Twice (I, J : in Matrix_Index) return A_Element_Pair is
      y0 : constant Real := Real (((I + J    )*(I + J + 1))/2 + I + 1);
      y1 : constant Real := Real (((I + J + 1)*(I + J + 2))/2 + I + 1);
   begin
      return Division.D.Ratios (1.0, 1.0, y0, y1);
   end Eval_A_Twice;

   Half_Matrix_Size : constant Matrix_Index := Matrix_Size / 2;

   overriding
   procedure Eval_A_Times
     (Iron          : in     Vanilla;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      Au            :    out Matrix)
   is
      J_Index : Matrix_Index;
      A_Elements : A_Element_Pair;
      Sum : Real;
   begin
      for I in Start .. Finish loop
         Sum := 0.0;
         for J in Matrix_Index range 0 .. Half_Matrix_Size - 1 loop
            J_Index    := U'First + 2*J;
            A_Elements := Eval_A_Twice (I, J_Index);
            Sum := Sum + A_Elements(0) * U(J_Index) + A_Elements(1) * U(J_Index+1);
         end loop;
         if Matrix_Size mod 2 = 1 then
            Sum := Sum + Eval_A (U'Last, I) * U(U'Last); -- J_Index := U'Last;
         end if;
         Au(I) := Sum;
      end loop;
   end Eval_A_Times;

   overriding
   procedure Eval_At_Times
     (Iron          : in     Vanilla;
      U             : in     Matrix;
      Start, Finish : in     Matrix_Index;
      Au            :    out Matrix)
   is
      J_Index : Matrix_Index;
      A_Elements : A_Element_Pair;
      Sum : Real;
   begin
      for I in Start .. Finish loop
         Sum := 0.0;
         for J in Matrix_Index range 0 .. Half_Matrix_Size - 1 loop
            J_Index    := U'First + 2*J;
            A_Elements := Eval_A_tr_Twice (I, J_Index);
            Sum := Sum + A_Elements(0) * U(J_Index) + A_Elements(1) * U(J_Index+1);
         end loop;
         if Matrix_Size mod 2 = 1 then
            Sum := Sum + Eval_A (U'Last, I) * U(U'Last); -- J_Index := U'Last;
         end if;
         Au(I) := Sum;
      end loop;
   end Eval_At_Times;

end Spectral_Utils.D;
