pragma Source_Reference (000464, "regexredux.gnat-5.gnat");

with U;
package Block_Input is

   function Read return U.String_Access;
   procedure Open_Stdin;
   procedure Close_Stdin;

end Block_Input;
