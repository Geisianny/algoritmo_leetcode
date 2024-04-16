pragma Source_Reference (000499, "spectralnorm.gnat-4.gnat");


package Division.S is

   --  force SSE operations

   type SSE_Vector is array (0 .. 1) of SSE_Real;
   for SSE_Vector'Alignment use 16;
   pragma Machine_Attribute (SSE_Vector, "vector_type");
   pragma Machine_Attribute (SSE_Vector, "may_alias");

   function "+" (X, Y : SSE_Vector) return SSE_Vector;
   function "*" (X, Y : SSE_Vector) return SSE_Vector;
   function "/" (X, Y : SSE_Vector) return SSE_Vector;

private
   pragma Import (Intrinsic, "+", "__builtin_ia32_addpd");
   pragma Import (Intrinsic, "*", "__builtin_ia32_mulpd");
   pragma Import (Intrinsic, "/", "__builtin_ia32_divpd");
end Division.S;
