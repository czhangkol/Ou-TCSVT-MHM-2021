function [maxM,range] = estMaxM(His,Capacity,maxD)

range = zeros(3,16);
maxM = 99;

for m = 1:16
    
    range(1,m) = m;
    d = maxD;
    minCapacity = 0;
    maxCapacity = 0;
    for j=1:m
        minCapacity = minCapacity + sum(His(256-d+1:256+d-2,m));
        maxCapacity = maxCapacity + sum(His(256-d:256+d-1,m));
    end
    for j=m+1:16
        maxCapacity = maxCapacity + sum(His(255:256,m));
    end
    
%     minCapacity = minCapacity + 1;
    
    range(2,m) = minCapacity;
    range(3,m) = maxCapacity;
    
end

for m =1:16
    if range(2,m)>=Capacity
        maxM = range(1,m);
        break
    end
end




end