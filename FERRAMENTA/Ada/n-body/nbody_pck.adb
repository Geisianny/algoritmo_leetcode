pragma Source_Reference (000065, "nbody.gnat-2.gnat");

-----------------------
-- nbody_pck.adb
-----------------------
package body Nbody_Pck is

   procedure Advance(DT: S_Real) is
      N: constant Integer := (Bodies'Length-1)*Bodies'Length/2;      
      R_Array : R_Array_Type;      
      Mag : Mag_Type;
      K: Integer := 0;
   begin
      for I in Bodies'First..Bodies'Last-1 loop
         for J in I+1..Bodies'Last loop
            R_Array(K).DX := Bodies(I).X - Bodies(J).X;
            R_Array(K).DY := Bodies(I).Y - Bodies(J).Y;
            R_Array(K).DZ := Bodies(I).Z - Bodies(J).Z;
            
            K := K + 1;
         end loop;
      end loop;

      declare 
         DX, DY, DZ, D_Squared, Distance, dmag: m128d;
      begin
         K:= 0;
         while K < N loop
            DX(0):= R_Array(K).DX;
            DY(0):= R_Array(K).DY;
            DZ(0):= R_Array(K).DZ;
            DX(1):= R_Array(K+1).DX;
            DY(1):= R_Array(K+1).DY;
            DZ(1):= R_Array(K+1).DZ;

            D_Squared:= ia32_Mul(DX, DX) + ia32_Mul(DY, DY) + ia32_Mul(DZ, DZ);

            Distance:= ia32_CvtPS_PD(ia32_RSqrt(ia32_CvtPD_PS(D_Squared)));

            for J in 1..2 loop
               Distance:= Distance * (1.5, 1.5) -
                  (((0.5, 0.5) * D_Squared) * Distance) *
                  (Distance * Distance);
            end loop;

            dmag := ia32_Div((DT, DT), D_Squared) * Distance;

            Mag(K):= dmag(0);
            Mag(K+1):= dmag(1);

            K:= K + 2;
         end loop;         
      end;

      K:= 0;
      for I in Bodies'First..Bodies'Last-1 loop
         for J in I+1..Bodies'Last loop
            Bodies(I).VX:= Bodies(I).VX - (R_Array(K).DX * Bodies(J).Mass * Mag(K));
            Bodies(I).VY:= Bodies(I).VY - (R_Array(K).DY * Bodies(J).Mass * Mag(K));
            Bodies(I).VZ:= Bodies(I).VZ - (R_Array(K).DZ * Bodies(J).Mass * Mag(K));

            Bodies(J).VX := Bodies(J).VX + (R_Array(K).DX * Bodies(I).Mass * Mag(K));
            Bodies(J).VY := Bodies(J).VY + (R_Array(K).DY * Bodies(I).Mass * Mag(K));
            Bodies(J).VZ := Bodies(J).VZ+ (R_Array(K).DZ * Bodies(I).Mass * Mag(K));

            K := K + 1;
         end loop;
      end loop;


      for I of Bodies loop

         I.X := I.X + (DT * I.VX);
         I.Y := I.Y + (DT * I.VY);
         I.Z := I.Z + (DT * I.VZ);

      end loop;

   end Advance;

   function Energy return S_Real is
      E: S_Real := 0.0;
      DX, DY, DZ, Distance : S_Real;
   begin
      for I in Bodies'Range loop
         E := E + (0.5 * Bodies(I).Mass *
                ( Bodies(I).VX * Bodies(I).VX
                    + Bodies(I).VY * Bodies(I).VY
                    + Bodies(I).VZ * Bodies(I).VZ ));
         for J in I+1..Bodies'Last loop
            declare
               J_Body: constant System := Bodies(J);
            begin
               DX := Bodies(I).X - J_Body.X;
               DY := Bodies(I).Y - J_Body.Y;
               DZ := Bodies(I).Z - J_Body.Z;

               Distance := Sqrt(DX*DX + DY*DY + DZ*DZ);
               E := E - ((Bodies(I).Mass * J_Body.Mass) / Distance);
            end;
         end loop;
      end loop;
      return E;
   end Energy;

begin
   PX := 0.0;
   PY :=0.0; 
   PZ := 0.0;

   for I of Bodies loop
      PX := PX + (I.VX * I.Mass);
      PY := PY + (I.VY * I.Mass);
      PZ := PZ + (I.VZ * I.Mass);
   end loop;
   Systems.Offset_Momentum(Bodies(0), PX, PY, PZ);
   
end Nbody_Pck;
