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
--  FILE: matmult.ads
--  SOURCE : developed by Thomas Lundqvist at Chalmers.
--  DESCRIPTION :
--   Matrix multiplication

package Matmult is

   type Data is array (Positive range <>, Positive range <>) of Integer;
   type Matrix (Rows : Positive; Cols : Positive) is record
      Mat : Data (1 ..Rows,1..Cols);
   end record;

   procedure Init_Seed;

   function MM_Multiply (A : in Matrix; B : in Matrix) return Matrix;

   procedure MM_Test (A : in out Matrix; B : in out Matrix);

   procedure MM_Initialize (A : in out Matrix);

   function MM_RandomInteger return Integer;

   procedure Matmult_main;


end Matmult;
