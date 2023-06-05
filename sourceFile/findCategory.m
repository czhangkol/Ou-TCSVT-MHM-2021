function Cindex = findCategory(flag,A)
Cindex  = 9;
      for i = 1:8         
          val = find(A{i,1} == flag);  
          if val > 0
              Cindex = i;
          end
      end

end