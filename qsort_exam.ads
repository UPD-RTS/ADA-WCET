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
--  FILE: qsort_exam.ads
--  SOURCE : Numerical Recipes in C - The Second Edition
--  DESCRIPTION :
--   Non-recursive version of quick sort algorithm.
--   This example sorts a 20 floating point numbers array

with Interfaces.C; use Interfaces.C;

package Qsort_exam is
   type Float_Array is array (1 .. 20) of Float;
   type Stack_Array is array (1 .. 100) of Integer;

   procedure Qsort_main;

private

   Init_Arr : Float_Array := (5.0, 4.0, 10.3, 1.1, 5.7, 100.0, 231.0, 111.0,
                         49.5, 99.0, 10.0, 150.0, 222.22, 101.0, 77.0, 44.0,
                              35.0, 20.54, 99.99, 88.88);
   Arr : Float_Array;

end Qsort_exam;
