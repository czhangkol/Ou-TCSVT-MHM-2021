function [bin_LM_len,I] = LocationMapD(I,d,dir)
[d1,d2] = size(I);
flow_map = zeros(1,d1*d2);
index = 1;
for i = 2:d1-2
    if dir+mod(i,2)==2
        kk=0;
    else
        kk=dir+mod(i,2);
    end
    for j = 2+kk:2:d2-2
        
        if abs(I(i,j) - 255) <= d-1
            x = abs(I(i,j) - 255)+1;
            flow_map(index) =  x;
            index = index + 1;
        elseif abs(I(i,j) - 0) <= d-1
            x = abs(I(i,j) - 255)+1;
            flow_map(index) =  x;
            index = index + 1;
        elseif abs(I(i,j) - 255) == d
            flow_map(index) =  0;
            index = index + 1;
        elseif abs(I(i,j) - 0) == d
            flow_map(index) =  0;
            index = index + 1;
        end
        
        
    end
end


%after compression
cPos_x = cell(1,1);%ËãÊõ±àÂëÑ¹Ëõ
cPos_x{1} = flow_map;
if isempty(flow_map)
    bin_LM_len = 0;
    
else
    bin_LM_len =8*sum(flow_map>0);
end

end