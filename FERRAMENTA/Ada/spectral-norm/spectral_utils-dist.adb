pragma Source_Reference (000368, "spectralnorm.gnat-4.gnat");

package body Spectral_Utils.Dist is

   -- Create (No_Of_Tasks-1) tasks. The final task is the environmental task,
   -- which does its fair share of the work in procedure Eval_Ata_Times_U.

   subtype Task_Range is Matrix_Index range 1 .. No_Of_Tasks-1;

   Partial_Matrix_A_times_U    : array (Task_Range) of Matrix_A_times_U;
   Partial_Matrix_A_tr_times_V : array (Task_Range) of Matrix_A_tr_times_V;

   procedure Eval_Ata_Times_U
      (Iron                  : in     Matrix_Computation'Class;
       U                     : in     Matrix;
       A_transpose_A_times_U :    out Matrix)
   is
      V, Partial_Product : Matrix;

      Segment_Length : constant Matrix_Index := Matrix_Size / No_Of_Tasks;

      I1, I2, J1, J2 : Matrix_Index;
   begin
      I1 := V'First;
      I2 := V'First + Segment_Length - 1;
      I2 := Matrix_Index'Min (I2, V'Last);

      -- Start running the tasks in Task_Range:

      for k in Task_Range loop
         Partial_Matrix_A_times_U(k).Multiply (U, I1, I2);
         I1 := I2 + 1;
         I2 := I2 + Segment_Length;
         I2 := Matrix_Index'Min (I2, V'Last);
      end loop;

      Iron.Eval_A_Times (U, I1, V'Last, V); -- Env task updates V(I1 .. V'Last).

      -- Rendezvous with tasks to get partial results. Write results to V:

      for k in Task_Range loop
         Partial_Matrix_A_times_U(k).Result (J1, J2, Partial_Product);
         V(J1 .. J2) := Partial_Product(J1 .. J2);
      end loop;

      -- The result, stored in V, is A*U. Next get A_transpose * (A*U).

      I1 := V'First;
      I2 := V'First + Segment_Length - 1;
      I2 := Matrix_Index'Min (I2, V'Last);

      for k in Task_Range loop
         Partial_Matrix_A_tr_times_V(k).Multiply (V, I1, I2);
         I1 := I2 + 1;
         I2 := I2 + Segment_Length;
         I2 := Matrix_Index'Min (I2, V'Last);
      end loop;

      Iron.Eval_At_Times (V, I1, V'Last, A_transpose_A_times_U);
      -- Env. task updates A_transpose_A_times_U (I1 .. V'Last).

      for k in Task_Range loop
         Partial_Matrix_A_tr_times_V(k).Result (J1, J2, Partial_Product);
         A_transpose_A_times_U(J1 .. J2) := Partial_Product(J1 .. J2);
      end loop;

   end Eval_Ata_Times_U;

   task body Matrix_A_times_U is
      I1, I2 : Matrix_Index;
      AU, U_local : Matrix;
      Calculator : constant Matrix_Computation'Class := Make_Calculator;
   begin
     loop
     select
        accept Multiply (U : in Matrix; Start, Finish : in Matrix_Index) do
           I1 := Start;
           I2 := Finish;
           U_local := U;
        end Multiply;

        Calculator.Eval_A_Times (U_Local, I1, I2, AU); -- updates AU(I1..I2)

        accept Result (Start, Finish : out Matrix_Index; R : out Matrix) do
           Start  := I1;
           Finish := I2;
           R(Start .. Finish) := AU(Start .. Finish);
        end Result;
     or
        terminate;
     end select;
     end loop;
   end Matrix_A_times_U;

   task body Matrix_A_tr_times_V is
      I1, I2 : Matrix_Index;
      AV, V_local : Matrix;
      Calculator : constant Matrix_Computation'Class := Make_Calculator;
   begin
     loop
     select
        accept Multiply (V : in Matrix; Start, Finish : in Matrix_Index) do
           I1 := Start;
           I2 := Finish;
           V_local := V;
        end Multiply;

        Calculator.Eval_At_Times (V_Local, I1, I2, AV);
        -- AV = A_transpose * V_local

        accept Result (Start, Finish : out Matrix_Index; R : out Matrix) do
           Start  := I1;
           Finish := I2;
           R(Start .. Finish) := AV(Start .. Finish);
        end Result;
     or
        terminate;
     end select;
     end loop;
   end Matrix_A_tr_times_V;

end Spectral_Utils.Dist;
