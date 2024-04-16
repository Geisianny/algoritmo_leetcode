pragma Source_Reference (000001, "nbody.gnat-2.gnat");
-----------------------
-- nbody.adb
-----------------------
-- The Computer Language Benchmarks Game
-- http://benchmarksgame.alioth.debian.org
--
-- Contributed by Brian Kolden
-- Ada port of Mark C. Lewis's N-Body
-- Built off of Pascal Obry's N-Body

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;      use Ada.Text_IO;
with Nbody_Pck;   use Nbody_Pck;
with Root; use Root;
procedure Nbody is
   pragma Suppress(All_Checks);

   N : constant Positive := Integer'Value (Argument (1));

   package RIO is new Ada.Text_IO.Float_Io (S_Real);

   procedure Put
     (Item : S_Real; Fore : Field := 0; Aft : Field := 9;
      Exp  : Field := 0) renames RIO.Put;

begin
   Put (Energy);
   New_Line;

   for I in 1 .. N loop
      Advance (0.01);
   end loop;

   Put (Energy);
   New_Line;

end Nbody;
