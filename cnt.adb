--  =======================================================
--  Ada WCET Benchmark v.1.0
--  University of Padua
--  emezzett@math.unipd.it
--  =======================================================
--  Porting to Ada of C WCET becnhmark from:
--
--  Mälardalen WCET research group:
--	    http://www.mrtc.mdh.se/projects/wcet/benchmarks.html
--
--  SNU-RT Benchmark Suite for Worst Case Timing Analysis
--          Real-Time Research Group, Seoul National University
-- 	    S.-S. Lim (sslim@archi.snu.ac.kr)
--  =======================================================

with Interfaces.C; use Interfaces.C;

package body Cnt is

   Seed : Integer;
   Postotal, Negtotal, Poscnt, Negcnt : Integer;
   myArray : Int_Matrix;

   procedure Init_Seed is
   begin
      Seed := 0;
   end Init_Seed;

   function Random_Integer return Integer is
   begin
      Seed := ((Seed * 133) + 81) mod 8095;
      return Seed;
   end Random_Integer;

   procedure cnt_Initialize (myArray : in out Int_Matrix) is
      bound : Integer := myArray'Length;
   begin
      for OuterIndex in 1 .. bound loop
         for InnerIndex in 1 .. bound loop
            myArray (OuterIndex, InnerIndex) := Random_Integer;
         end loop;
      end loop;
   end cnt_Initialize;

   procedure Sum (mat : Int_Matrix) is
      Ptotal, Ntotal, Pcnt, Ncnt : Integer := 0;
   begin
      for Outer in 1 .. 10 loop
         for Inner in 1 .. 10 loop
            if (mat (Outer, Inner) < 0) then
               Ptotal := Ptotal + mat (Outer, Inner);
               Pcnt := Pcnt + 1;
            else
               Ntotal := Ntotal + mat (Outer, Inner);
               Ncnt := Ncnt + 1;
            end if;
         end loop;
      end loop;
      Postotal := Ptotal;
      Poscnt := Pcnt;
      Negtotal := Ntotal;
      Negcnt := Ncnt;
--     exception
--        when Error : others =>
--           Put_Line("---> " & Ada.Exceptions.Exception_Name(Error));
   end Sum;

   procedure Test (mat : in out Int_Matrix) is
      StartTime, StopTime : long;
      TotalTime : Float;
   begin
      cnt_Initialize (mat);
      StartTime := long (1000.0);
      Sum (mat);
      StopTime := long (1500.0);
      TotalTime := Float (StopTime - StartTime) / 1000.0;
   end Test;

   procedure Cnt_main is
   begin
      Init_Seed;
      Test (myArray);
   end Cnt_main;

end Cnt;
