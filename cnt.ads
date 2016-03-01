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
--  FILE: cnt.ads
--  SOURCE :
--  DESCRIPTION :
--   Sum of values of matrices

package Cnt is

   type Int_Matrix is array (1 .. 20, 1 .. 20) of Integer;

   procedure Cnt_main;

end Cnt;
