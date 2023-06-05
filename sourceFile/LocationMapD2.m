function [LM,bin_LM_len,I] = LocationMapD2(I,dir,PE,xpos,ypos,Capacity)
[d1,d2] = size(I);
flag = 0;
flag2 = 0;
 

for d = 1:5
    
    if flag2 == 1       
        break
    end
    
    pFor = 0;
    flow_map = zeros(1,(d1-2)*(d2-2)/2);
    index = 1;
    LM = zeros(1,(d1-2)*(d2-2)/2);
    TCap = 0;
    for i = 2:d1-2
        if dir+mod(i,2)==2
            kk=0;
        else
            kk=dir+mod(i,2);
        end
        for j = 2+kk:2:d2-2
            
%             iPE = find(xpos==i & ypos ==j);
            pFor = pFor + 1;            
            if abs(I(i,j) - 255) <= d-1
                flow_map(index) =  1;
                LM(pFor) = 1;
                index = index + 1;
            elseif abs(I(i,j) - 0) <= d-1
                flow_map(index) =  1;
                LM(pFor) = 1;
                index = index + 1;
            elseif abs(I(i,j) - 255) >= d && abs(I(i,j) - 255) <=2d-1
                flow_map(index) =  0;
                index = index + 1;
            elseif abs(I(i,j) - 0) >= d && abs(I(i,j) - 0) <=2d-1
                flow_map(index) =  0;
                index = index + 1;
            else
                if PE(pFor)<=d-1 && PE(pFor) >= -d
                TCap = TCap + 1;
                if TCap >= Capacity + index -1
%                     flow_map = flow_map(1:pFor);
%                     LM = LM(1:pFor);
                    flag = 1;
                    flag2 = 1;
%                     break
                end           
            end

            
            
            
        end
    end
end



%after compression
cPos_x = cell(1,1);%ËãÊõ±àÂëÑ¹Ëõ
cPos_x{1} = flow_map;
if isempty(flow_map)
    bin_LM_len = 0;
    
else
    bin_LM_len = sum(flow_map>0);
end

end