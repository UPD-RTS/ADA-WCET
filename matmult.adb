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

package body Matmult is

   Seed : Integer := 0;

   ArrayA, ArrayB, ResultArray : Matrix (20, 20);

   Matrix_Mismatch : exception;

   procedure Init_Seed is
   begin
      Seed := 0;
   end Init_Seed;


   procedure MM_Test (A : in out Matrix; B : in out Matrix) is
   begin
      MM_Initialize (A);
      MM_Initialize (B);
      ResultArray := MM_Multiply (A, B);
   end MM_Test;



   function MM_Multiply (A : in Matrix; B : in Matrix) return Matrix is
      result : Matrix (A.Rows, B.Cols);
   begin
      if A.Rows /= B.Cols then
         raise Matrix_Mismatch;
      end if;
      for i in 1 .. A.Rows loop
         for j in 1 .. B.Cols loop
            result.Mat (i, j) := 0;
            for k in 1 .. A.Cols loop
               result.Mat (i, j) :=
                 result.Mat (i, j) + (A.Mat(i,k) * B.Mat(k,j));
            end loop;
         end loop;
      end loop;
      return result;
   end MM_Multiply;

   procedure MM_Initialize (A : in out Matrix) is
      --  r, c : Integer;
   begin
      for i in 1 .. A.Rows loop
         for j in 1 .. A.Cols loop
            A.Mat (i, j) := MM_RandomInteger;
         end loop;
      end loop;
   end MM_Initialize;

   function MM_RandomInteger return Integer is
   begin
      Seed := (((Seed * 133) + 81) mod 8095);
      return Seed;
   end MM_RandomInteger;

   procedure Matmult_main is
   begin
      Init_Seed;
      MM_Test (ArrayA, ArrayB);
   end Matmult_main;

end Matmult;
