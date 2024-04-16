pragma Source_Reference (000259, "nbody.gnat-2.gnat");

-----------------------
-- root.ads
-----------------------
package Root is

   pragma Pure;
   pragma Suppress(All_Checks);

   type S_Real is new Long_Float;

   pragma Assert (S_Real'Size = 64 and S_Real'digits > 13);

   type m128d is array (0 .. 1) of S_Real;
   for m128d'Alignment use 16;
   pragma Machine_Attribute (m128d, "vector_type");

   type m128s is array (0 .. 3) of Float;
   for m128s'Alignment use 16;
   pragma Machine_Attribute (m128s, "vector_type");
   pragma Assert (Float'Digits < 7 and m128s'size = 128);

   function ia32_Div (X, Y : m128d) return m128d;
   pragma Import (Intrinsic, ia32_Div, "__builtin_ia32_divpd");
   pragma Inline(ia32_Div);

   function ia32_Sqrt (X : m128d) return m128d;
   pragma Import (Intrinsic, ia32_Sqrt, "__builtin_ia32_sqrtpd");
   pragma Inline(ia32_Sqrt);

   function ia32_Mul (X, Y : m128d) return m128d;
   pragma Import (Intrinsic, ia32_Mul, "__builtin_ia32_mulpd");
   pragma Inline(ia32_Mul);   

   function ia32_Add (X, Y : m128d) return m128d;
   pragma Import (Intrinsic, ia32_Add, "__builtin_ia32_addpd");
   pragma Inline(ia32_Add);

   function ia32_Sub (X, Y : m128d) return m128d;
   pragma Import (Intrinsic, ia32_Sub, "__builtin_ia32_subpd");
   pragma Inline(ia32_Sub);

   function Sqrt (X : S_Real) return S_Real;
   pragma Inline(Sqrt);

   function "*" (Left, Right: m128d) return m128d is(
      ia32_Mul(Left, Right));
   function "+" (Left, Right: m128d) return m128d is(
      ia32_Add(Left, Right));
   function "-" (Left, Right: m128d) return m128d is(
      ia32_Sub(Left, Right));

   function ia32_RSqrt (X : m128s) return m128s;
   pragma Import (Intrinsic, ia32_RSqrt, "__builtin_ia32_rsqrtps");
   pragma Inline(ia32_RSqrt);

   function ia32_CvtPD_PS(X: m128d) return m128s;
   pragma Import (Intrinsic, ia32_CvtPD_PS, "__builtin_ia32_cvtpd2ps");
   pragma Inline(ia32_CvtPD_PS);

   function ia32_CvtPS_PD(X: m128s) return m128d;
   pragma Import (Intrinsic, ia32_CvtPS_PD, "__builtin_ia32_cvtps2pd");
   pragma Inline(ia32_CvtPS_PD);

   function ia32_Set(X: S_Real) return m128d;
   pragma Import (Intrinsic, ia32_Set, "__builting_ia32_set1pd");
   pragma Inline(ia32_Set);

   x : constant m128d := (4.0, 6.0);
   y : constant m128d := (2.0, 2.0);

end Root;
