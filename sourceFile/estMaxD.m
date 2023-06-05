function [maxD,range] = estMaxD(His,Capacity)

range = zeros(3,5);
maxD = 12;

for i = 1:12
    
    range(1,i) = i;
    d = i - 1;
    minCapacity = 0;
    maxCapacity = 0;
    for j=1:16
        if d >= 1
            minCapacity = minCapacity + sum(His(256-d:256+d-1,j));
            maxCapacity = maxCapacity + sum(His(256-d-1:256+d,j));
        else
            maxCapacity = maxCapacity + sum(His(256-d-1:256+d,j));
        end
    end
    minCapacity = minCapacity + 1;
    
    range(2,i) = minCapacity;
    range(3,i) = maxCapacity;
    
end

for i =1:12
    if range(3,i)>=Capacity
        maxD = range(1,i);
        break
    end
end





end