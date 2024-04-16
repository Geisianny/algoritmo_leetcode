pragma Source_Reference (000245, "nbody.gnat-2.gnat");

-----------------------
-- systems.adb
-----------------------
package body Systems is

   procedure Offset_Momentum (This: in out System; PX,PY, PZ: S_Real) is
   begin
      This.VX := -PX / SOLAR_MASS;
      This.VY := -PY / SOLAR_MASS;
      This.VZ := -PZ / SOLAR_MASS;
   end Offset_Momentum;

end Systems;   
