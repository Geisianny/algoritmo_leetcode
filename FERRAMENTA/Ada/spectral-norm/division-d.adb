pragma Source_Reference (000528, "spectralnorm.gnat-4.gnat");

package body Division.D is

   type m128d is array (0 .. 1) of SSE_Real;
   for m128d'Alignment use 16;
   pragma Machine_Attribute (m128d, "vector_type");
   pragma Machine_Attribute (m128d, "may_alias");

   function Div (X, Y : m128d) return m128d;
   pragma Import (Intrinsic, Div, "__builtin_ia32_divpd");

   function Ratios (x0, x1, y0, y1 : in SSE_Real) return SSE_Vector is
      z : constant m128d := Div ((x0, x1), (y0, y1));
   begin
      return (z(0), z(1));
   end Ratios;

end Division.D;