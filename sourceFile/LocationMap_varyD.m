function [bin_LM,bin_LM_len,Iw] = LocationMap_varyD(I,delta,dir)
[d1,d2] = size(I);
flow_map = [];
Iw = I;
for i = 2:d1-1

    if dir+mod(i,2)==2
        kk=0;
    else
        kk=dir+mod(i,2);
    end
    for j = 2+kk:2:d2-2
        
        if I(i,j) <=255 && I(i,j) >= 255-delta
            flow_map = [flow_map 1];
            Iw(i,j) = I(i,j) - delta;
        elseif I(i,j) <=delta-1 && I(i,j) >= 0
            flow_map = [flow_map 1];
            Iw(i,j) = I(i,j) - delta;
        end
        
        if I(i,j) <=255-delta-1 && I(i,j) >= 255-2*delta
            flow_map = [flow_map 0];
            Iw(i,j) = I(i,j) + delta;
        elseif I(i,j) <=2*delta-1 && I(i,j) >= delta
            flow_map = [flow_map 0];
            Iw(i,j) = I(i,j) + delta;
        end
        
        
    end
end



%after compression
cPos_x = cell(1,1);%ËãÊõ±àÂëÑ¹Ëõ
cPos_x{1} = flow_map;

loc_Com =  arith07(cPos_x);
bin_index = 8;
[bin_LM, bin_LM_len] = dec_transform_bin(loc_Com, bin_index);


% if isempty(flow_map)
%     bin_LM_len = 0;
%     
% else
%     bin_LM_len = sum(flow_map>0);
% end

end