pragma Source_Reference (000489, "spectralnorm.gnat-4.gnat");

package Division is

   pragma Pure (Division);

   type SSE_Real is new Long_Float;

private
   pragma Assert (SSE_Real'Size = 64 and SSE_Real'digits > 13);
end Division;
