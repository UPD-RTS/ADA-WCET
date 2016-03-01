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
--  FILE: qurt.ads
--  SOURCE : Turbo C Programming for Engineering by Hyun Soo Ahn
--  DESCRIPTION :
--   Root computation of quadratic equations.
--   The real and imaginary parts of the solution are stored in the
--   arrays x1[] and x2[].

package Qurt is

   type Double is digits 15;
   type Double_Array is array (Positive range <>) of Double;

   procedure Qurt_main;
   --  function Sqrt (val : in Double) return Double;
   --  function Qurt return Integer;

private
   flag : Integer := 0;
   a : Double_Array (1 .. 3);
   x1, x2 : Double_Array (1 .. 2);

   --  double a[3], x1[2], x2[2];

end Qurt;
