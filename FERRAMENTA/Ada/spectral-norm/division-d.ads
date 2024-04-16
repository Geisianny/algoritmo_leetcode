pragma Source_Reference (000519, "spectralnorm.gnat-4.gnat");


package Division.D is

   type SSE_Vector is array(0 .. 1) of SSE_Real;

   function Ratios (x0, x1, y0, y1 : in SSE_Real) return SSE_Vector;

end Division.D;
