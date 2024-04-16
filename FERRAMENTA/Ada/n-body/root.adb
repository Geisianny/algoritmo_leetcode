pragma Source_Reference (000331, "nbody.gnat-2.gnat");

-----------------------
-- root.adb
-----------------------
package body root is

   function Sqrt (X : S_Real) return S_Real is
   begin 
      return ia32_Sqrt ((X, 1.0))(0);
   end Sqrt;

end root;