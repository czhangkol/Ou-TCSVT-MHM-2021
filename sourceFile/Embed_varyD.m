function [dEC,delta,markP] = Embed_varyD(e,Tr,bk,p,bit)

delta = 0;
dEC = 0;
markP = p;

Tl = -Tr-1;
dd = Tr+1;

if Tr < 0
    %-----------no inner level
    dd = 0;
    if bk ~= 99
        if e== bk || e == -bk - 1
            
            delta = dd^2+dd+0.5;
            dEC = 1;
            if e >= 0
                markP = p + bit + dd;
            else
                markP = p - bit - dd;
            end
            
        elseif e > bk || e< -bk -1
            
            delta =(dd+1)^2;
            if e >= 0
                markP = p  + (dd+1);
            else
                markP = p  - (dd-1);
            end
            
        end
    end
else
    %----------- inner level + outer level
    if bk ~= 99
        if e <= Tr && e >=Tl
            delta = e^2+e+0.5;
            dEC = 1;
            if e >= 0
                markP = p + bit + e;
            else
                markP = p + bit + e;
            end
        elseif e >Tr && e <bk
            delta = dd^2;
            markP = p  + dd;
        elseif e < Tl && e >-bk-1
            delta = dd^2;
            markP = p  - dd;
        elseif e== bk || e == -bk - 1
            delta = dd^2+dd+0.5;
            dEC = 1;
            if e >= 0
                markP = p + bit + dd;
            else
                markP = p - bit - dd;
            end
        elseif e > bk || e< -bk -1
            delta =(dd+1)^2;
            if e >= 0
                markP = p  + (dd+1);
            else
                markP = p  - (dd-1);
            end
        end
    else
        if e <= Tr && e >=Tl
            delta = e^2+e+0.5;
            dEC = 1;
            if e >= 0
                markP = p + bit + e;
            else
                markP = p + bit + e;
            end
        else
            delta = dd^2;
            dEC = 0;
            if e >= 0
                markP = p + dd;
            else
                markP = p - dd;
            end
        end
    end
end


end