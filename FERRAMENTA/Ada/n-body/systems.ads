pragma Source_Reference (000182, "nbody.gnat-2.gnat");

-----------------------
-- systems.ads
-----------------------
with Root; use Root;
package Systems is
   pragma Suppress(All_Checks);
   
   type System is record
      X, Y, Z: S_Real:=0.0;
      Filler: S_Real;
      VX, VY, VZ: S_Real;
      Mass: S_Real;
   end record;

   PI: constant S_Real := 3.141592653589793;
   SOLAR_MASS: constant S_Real := 4.0 * PI * PI;
   DAYS_PER_YEAR: constant S_Real := 365.24;

   Jupiter: System:= (
      X => 4.84143144246472090e+00,
      Y => -1.16032004402742839e+00,
      Z => -1.03622044471123109e-01,
      VX => 1.66007664274403694e-03 * DAYS_PER_YEAR,
      VY => 7.69901118419740425e-03 * DAYS_PER_YEAR,
      VZ => -6.90460016972063023e-05 * DAYS_PER_YEAR,
      Mass => 9.54791938424326609e-04 * SOLAR_MASS,
      Others => 0.0);
   Saturn: System:= (
      X => 8.34336671824457987e+00,
      Y => 4.12479856412430479e+00,
      Z => -4.03523417114321381e-01,
      VX => -2.76742510726862411e-03 * DAYS_PER_YEAR,
      VY => 4.99852801234917238e-03 * DAYS_PER_YEAR,
      VZ => 2.30417297573763929e-05 * DAYS_PER_YEAR,
      Mass => 2.85885980666130812e-04 * SOLAR_MASS,
      Others => 0.0);
   Uranus: System:= (
      X => 1.28943695621391310e+01,
      Y => -1.51111514016986312e+01,
      Z => -2.23307578892655734e-01,
      VX => 2.96460137564761618e-03 * DAYS_PER_YEAR,
      VY => 2.37847173959480950e-03 * DAYS_PER_YEAR,
      VZ => -2.96589568540237556e-05 * DAYS_PER_YEAR,
      Mass => 4.36624404335156298e-05 * SOLAR_MASS,
      Others => 0.0);
   Neptune: System:= (
      X => 1.53796971148509165e+01,
      Y => -2.59193146099879641e+01,
      Z => 1.79258772950371181e-01,
      VX => 2.68067772490389322e-03 * DAYS_PER_YEAR,
      VY => 1.62824170038242295e-03 * DAYS_PER_YEAR,
      VZ => -9.51592254519715870e-05 * DAYS_PER_YEAR,
      Mass => 5.15138902046611451e-05 * SOLAR_MASS,
      Others => 0.0);
   Sun: System:= (
      Mass => SOLAR_MASS,
      Others => 0.0);

   procedure Offset_Momentum (This: in out System; PX,PY, PZ: S_Real);
   pragma Inline(Offset_Momentum);

end Systems;
