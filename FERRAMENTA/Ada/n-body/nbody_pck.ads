pragma Source_Reference (000038, "nbody.gnat-2.gnat");

-----------------------
-- nbody_pck.ads
-----------------------
with Systems; use Systems;
with Ada.Text_IO;      use Ada.Text_IO;
with Root; use Root;
package Nbody_Pck is
   pragma Elaborate_Body;
   pragma Suppress(All_Checks);
   
   type R is record
      DX, DY, DZ, Filler: S_Real;
   end record;
   for R'Alignment use 16;
   type R_Array_Type is array(0..999) of R;

   type Mag_Type is array (0..999) of S_Real;
   for Mag_Type'Alignment use 16;

   PX, PY, PZ: S_Real;
   Bodies: array(0..4) of System:=(Sun, Jupiter, Saturn, Uranus, Neptune);

   procedure Advance(DT: S_Real);
   function Energy return S_Real;

end Nbody_Pck;
