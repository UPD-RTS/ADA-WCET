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
with Interfaces; use Interfaces;
--  with System.IO; use System.IO;

package body Qsort_exam is

   Istack : Stack_Array := (others => 0);

--     procedure Print_Array is
--     begin
--        Put("Array: ");
--        for I in Arr'Range loop
--           Put_Line("   " & Float'Image(Arr(I)));
--           --  Put_Line("   " & Float'Image(Arr2(I)) & "   " & Float'Image(Arr(I)));
--        end loop;
--     end Print_Array;
--
--     procedure Print_Part (start_ind:Integer; end_ind:Integer)is
--     begin
--        for I in start_ind..end_ind loop
--           Put_Line("   " & Float'Image(Arr(I)));
--        end loop;
--     end Print_Part;


   procedure Swap (i : Integer; j : Integer) is
      Temp : Float;
   begin
      Temp := Arr (i);
      Arr (i) := Arr (j);
      Arr (j) := Temp;
   end Swap;

   function Sort (n : Integer) return Integer is
      i, ir, j, k, l : Integer;
      jstack : Integer;
      a : Float;
   begin
      ir := n;
      l := 1;
      jstack := 0;

      while True loop
         if (ir - l < 7) then
            --  Simple Insertion Sort
            for j in (l + 1) .. ir loop
               a := Arr (j);
               i := j - 1;
               while i >= l and then Arr (i) >a loop
                  Arr (i + 1) := Arr (i);
                  i := i - 1;
               end loop;
                Arr (i + 1) := a;
            end loop;
            if (jstack = 0) then
               --  Print_Array;
               return 0;
            end if;
            ir :=  Istack (jstack);
            jstack := jstack - 1;
            l :=  Istack (jstack);
            jstack := jstack - 1;
         else
            --  Non recursive Quick Sort
            --  Divide step
            --  Right_Shift (Integer'size on LEON is 32)
            k := Integer (Shift_Right (Unsigned_32 (l +ir),1));
            Swap (k, l + 1);
            if (Arr (l)) > Arr (ir) then
               Swap (l, ir);
            end if;
            if (Arr (l + 1) > Arr (ir)) then
               Swap (l + 1, ir);
            end if;
            if (Arr (l) > Arr (l+1)) then
               Swap (l, l + 1);
            end if;
            i := l + 1;
            j := ir;
            a :=  Arr (l + 1);
            while True loop
               loop
                  i := i + 1;
                  exit when (Arr (i) >= a);
               end loop;
               loop
                  j := j - 1;
                  exit when (Arr (j) <= a);
               end loop;
               exit when (j < i);
               Swap (i, j);
            end loop;
            Swap (l + 1, j);
            jstack := jstack + 2;
            if (ir - i + 1 >= j-l) then
                Istack (jstack) := ir;
                Istack (jstack - 1) := i;
               ir := j - 1;
            else
               Istack (jstack) := j - 1;
               Istack (jstack - 1) := l;
               l := i;
            end if;
         end if;
      end loop;
      return 2;
   end Sort;

   procedure Qsort_main is
      res : Integer;
   begin
      Arr := Init_Arr;
      res := Sort (20);
   end Qsort_main;

end Qsort_exam;
