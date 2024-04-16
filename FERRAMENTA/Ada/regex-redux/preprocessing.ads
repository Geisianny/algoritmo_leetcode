pragma Source_Reference (000148, "regexredux.gnat-5.gnat");

with U;
package Preprocessing is

   --  removal of line feeds and FASTA sequence descriptions

   Separator  : constant String := (1 => ASCII.LF);

   task type Removal (Input_Text : access constant String) is
      pragma Storage_Size (2**16);
      entry Run (Clean : U.String_Access);
      entry Done (Last : out Natural);
      --  number of characters after removal
   end Removal;

end Preprocessing;
