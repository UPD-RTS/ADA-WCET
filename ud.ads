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
--  FILE: ud.ads
--  SOURCE : Turbo C Programming for Engineering
--  DESCRIPTION :
--   Simultaneous linear equations by LU decomposition.
--   The arrays a[][] and b[] are input and the array x[] is output row vector.
--   The input arrays are initialized in the package body.

with Interfaces.C; use Interfaces.C;
package Ud is
   type Long_Dbl_Array is array (Positive range <>) of long_double;
   type Long_Dbl_Matrix is array (Positive range <>, Positive range <>)
   	of long_double;


   procedure Ud_main;
   function Ludcmp (nmax : Integer; n : Integer) return Integer;

private
   a : Long_Dbl_Matrix (1 .. 50, 1 .. 50);
   b, x : Long_Dbl_Array (1 .. 50);

end Ud;
