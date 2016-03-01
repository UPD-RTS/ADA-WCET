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

package body Qurt is

   function Sqrt (val : in Double) return Double is
      x, dx, diff : Double;
      min_tol : Double := 0.00001;
      flag : Integer;
   begin
      x := val / 10.0;
      flag := 0;
      if (val = 0.0) then
         x := 0.0;
      else
         for i in 1 .. 20 loop
            if (flag = 0) then
               dx := (val - (x * x)) / (2.0 * x);
               x := x + dx;
               diff := val - (x * x);
               if (abs (diff) <= min_tol) then
                  flag := 1;
               end if;
            else
               x := x;
            end if;
         end loop;
      end if;
      return (x);
   end Sqrt;

   function Qurt return Integer is
      d, w1, w2 : Double;
   begin
      if (a (1) = 0.0) then
         return (999);
      end if;
      d := a (2) * a (2) - 4.0 * a(1) * a(3);
      w1 := 2.0 * a (1);
      w2 :=  Sqrt (abs (d));
      if (d > 0.0) then
         flag := 1;
         x1 (1) := (-a (2) + w2) / w1;
         x1 (2) := 0.0;
         x2 (1) := (-a (2) - w2) / w1;
         x2 (2) := 0.0;
         return (0);
      elsif (d = 0.0) then
         flag := 0;
         x1 (1) := -a (2) / w1;
         x1 (2) := 0.0;
         x2 (1) := x1 (1);
         x2 (2) := 0.0;
         return (0);
      else
         flag := -1;
         w2 := w2 / w1;
         x1 (1) := -a (2) / w1;
         x1 (2) := w2;
         x2 (1) := x1 (1);
         x2 (2) := -w2;
         return (0);
      end if;
   end Qurt;

   procedure Qurt_main is
      res : Integer;
   begin
      a (1) := 1.0;
      a (2) := -3.0;
      a (3) := 2.0;
      res := Qurt;

      a (1) := 1.0;
      a (2) := -2.0;
      a (3) := 1.0;
      res := Qurt;

      a (1) := 1.0;
      a (2) := -4.0;
      a (3) := 8.0;
      res := Qurt;
   end Qurt_main;


end Qurt;
