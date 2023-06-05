function [Iw,EC,ED] = circleEmbed_varyD(I,payload,code,PE,NL,pFor,record,xpos,ypos,maxD,A)

[d1,d2] = size(I);
Iw = I;

data = randperm(d1*d2);

    EC = 0;
    ED = 0;
    for i=1:pFor
        if EC >= payload
%             flag2 = 1;
            break
        end
 
        %区间1
        if NL(i) >=record(1) && NL(i) <=record(2)
            bk = code(1);
            flag = 1;
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
                
            continue
        end
        %区间2
        if NL(i) >=record(2)+1 && NL(i) <=record(3)
            flag = 2;
            bk = code(2);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间3
        if NL(i) >=record(3)+1 && NL(i) <=record(4)
            flag = 3;
            bk = code(3);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间4
        if NL(i) >=record(4)+1 && NL(i) <=record(5)
            flag = 4;
            bk = code(4);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间5
        if NL(i) >=record(5)+1 && NL(i) <=record(6)
            flag = 5;
            bk = code(5);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间6
        if NL(i) >=record(6)+1 && NL(i) <=record(7)
            flag = 6;
            bk = code(6);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间7
        if NL(i) >=record(7)+1 && NL(i) <=record(8)
            flag = 7;
            bk = code(7);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间8
        if NL(i) >=record(8)+1 && NL(i) <=record(9)
            flag = 8;
            bk = code(8);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间9
        if NL(i) >=record(9)+1 && NL(i) <=record(10)
            flag = 9;
            bk = code(9);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间10
        if NL(i) >=record(10)+1 && NL(i) <=record(11)
            flag = 10;
            bk = code(10);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间11
        if NL(i) >=record(11)+1 && NL(i) <=record(12)
            flag = 11;
            bk = code(11);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间12
        if NL(i) >=record(12)+1 && NL(i) <=record(13)
            flag = 12;
            bk = code(12);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间13
        if NL(i) >=record(13)+1 && NL(i) <=record(14)
            flag = 13;
            bk = code(13);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间14
        if NL(i) >=record(14)+1 && NL(i) <=record(15)
            flag = 14;
            bk = code(14);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间15
        if NL(i) >=record(15)+1 && NL(i) <=record(16)
            flag = 15;
            bk = code(15);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
        %区间16
        if NL(i) >=record(16)+1
            flag = 16;
            bk = code(16);
            
            Cindex = findCategory(flag,A);
            Tr = maxD-1-Cindex;
            bit = mod(data(fix(i/255)*500+mod(i,255)),2);
            p = I(xpos(i),ypos(i));
            [dEC,delta,markP] = Embed_varyD(PE(i),Tr,bk,p,bit);
            Iw(xpos(i),ypos(i)) = markP;
            EC = EC + dEC;
            ED = ED +delta;
            
            continue
        end
    end
% end

end