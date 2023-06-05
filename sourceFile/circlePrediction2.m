function [PE,NL,his,record,pFor,xpos,ypos] = circlePrediction2(I,dir)

[d1,d2] = size(I);
PE = zeros(1,(d1-2)*(d2-2)/2);
NL = zeros(1,(d1-2)*(d2-2)/2);
xpos = zeros(1,(d1-2)*(d2-2)/2);
ypos = zeros(1,(d1-2)*(d2-2)/2);


pFor = 1;
for i = 2:d1-2
    if dir+mod(i,2)==2
        kk=0;
    else
        kk=dir+mod(i,2);
    end
    for j = 2+kk:2:d2-2
                                   v1 = I(i-1,j);                   u6 = I(i-1,j+2);
            v2 = I(i  ,j-1); p  = I(i  ,j);  v4 = I(i  ,j+1); u7 = I(i  ,j+2);
            u1 = I(i+1,j-1); v3 = I(i+1,j);  u4 = I(i+1,j+1); u8 = I(i+1,j+2);
            u2 = I(i+2,j-1); u3 = I(i+2,j);  u5 = I(i+2,j+1); u9 = I(i+2,j+2);
            p = ceil((v1+v2+v3+v4)/4);
        
        PE(pFor) = I(i,j) - ceil((I(i-1,j) + I(i+1,j) + I(i,j-1) + I(i,j+1))/4);
        NL(pFor) = abs(v2-u1)+abs(u1-u2)+abs(v1-p)+abs(p-v3)+abs(v3-u3)+abs(v4-u4)+abs(u4-u5)+abs(u6-u7)+abs(u7-u8)+abs(u8-u9)+...
                abs(v2-p)+abs(p-v4)+abs(v4-u7)+abs(u1-v3)+abs(v3-u4)+abs(u4-u8)+abs(u2-u3)+abs(u3-u5)+abs(u5-u9);

        xpos(pFor) = i;
        ypos(pFor) = j;
        pFor = pFor + 1;
    end
end
pFor = pFor - 1;
PE = PE(1:pFor);
NL = NL(1:pFor);
xpos = xpos(1:pFor);
ypos = ypos(1:pFor);
[~,ind] = sort(NL);
PE = PE(ind);
NL = NL(ind);
xpos = xpos(ind);
ypos = ypos(ind);

M = 16;

H = zeros(511,max(NL(:))+1);
for i = 1:pFor
   H(PE(i)+256,NL(i)+1) = H(PE(i)+256,NL(i)+1)+1;        
end

record = zeros(1,16);

for i = 1:M-1
    for j = 1:max(NL(:))+1
        if sum(sum(H(:,1:j))) >= pFor/M*i;
            record(i+1) = j-1;
            break
        end
    end
end

% record = 0;
% j=0;
% for T = 0:max(NL)
%     num = 0;
%     if j > 14
%        break
%     end
%         
%     for i = 1:pFor
%         
%         if NL(i) <= T
%             num = num + 1;
%         end
%         if num >= (j+1)*pFor/M
%            record = [record T];       
%            if j <= 14
%            j = j + 1;
%            end
%            break
%         end
%     end
% end

his = zeros(511,16);
for i=1:pFor
    %区间1
    if NL(i) >=record(1) && NL(i) <=record(2)
        his(PE(i)+256,1) = his(PE(i)+256,1) + 1;
        continue
    end
     %区间2
    if NL(i) >=record(2)+1 && NL(i) <=record(3)
        his(PE(i)+256,2) = his(PE(i)+256,2) + 1;
        continue
    end
    %区间3
    if NL(i) >=record(3)+1 && NL(i) <=record(4)
        his(PE(i)+256,3) = his(PE(i)+256,3) + 1;
        continue
    end
    %区间4
    if NL(i) >=record(4)+1 && NL(i) <=record(5)
        his(PE(i)+256,4) = his(PE(i)+256,4) + 1;
        continue
    end
    %区间5
    if NL(i) >=record(5)+1 && NL(i) <=record(6)
        his(PE(i)+256,5) = his(PE(i)+256,5) + 1;
        continue
    end
    %区间6
    if NL(i) >=record(6)+1 && NL(i) <=record(7)
        his(PE(i)+256,6) = his(PE(i)+256,6) + 1;
        continue
    end
    %区间7
    if NL(i) >=record(7)+1 && NL(i) <=record(8)
        his(PE(i)+256,7) = his(PE(i)+256,7) + 1;
        continue
    end
    %区间8
    if NL(i) >=record(8)+1 && NL(i) <=record(9)
        his(PE(i)+256,8) = his(PE(i)+256,8) + 1;
        continue
    end
    %区间9
    if NL(i) >=record(9)+1 && NL(i) <=record(10)
        his(PE(i)+256,9) = his(PE(i)+256,9) + 1;
        continue
    end
    %区间10
    if NL(i) >=record(10)+1 && NL(i) <=record(11)
        his(PE(i)+256,10) = his(PE(i)+256,10) + 1;
        continue
    end
    %区间11
    if NL(i) >=record(11)+1 && NL(i) <=record(12)
        his(PE(i)+256,11) = his(PE(i)+256,11) + 1;
        continue
    end
    %区间12
    if NL(i) >=record(12)+1 && NL(i) <=record(13)
        his(PE(i)+256,12) = his(PE(i)+256,12) + 1;
        continue
    end
    %区间13
    if NL(i) >=record(13)+1 && NL(i) <=record(14)
        his(PE(i)+256,13) = his(PE(i)+256,13) + 1;
        continue
    end
    %区间14
    if NL(i) >=record(14)+1 && NL(i) <=record(15)
        his(PE(i)+256,14) = his(PE(i)+256,14) + 1;
        continue
    end
    %区间15
    if NL(i) >=record(15)+1 && NL(i) <=record(16)
        his(PE(i)+256,15) = his(PE(i)+256,15) + 1;
        continue
    end
    %区间16
    if NL(i) >=record(16)+1
        his(PE(i)+256,16) = his(PE(i)+256,16) + 1;
        continue
    end
end


end