function [Iw,EC,ED] = circleEmbed(I,payload,code,PE,NL,pFor,record,xpos,ypos,maxD,m)

Iw = I;
flag2 =0;
data = randperm(512^2);
% for T = 0:max(NL)
%     if flag2 == 1
%         break
%     end
    EC = 0;
    ED = 0;
    for i=1:pFor
        if EC >= payload
%             flag2 = 1;
            break
        end
%         if NL(i) > T
%             continue
%         end
        %区间1
        if NL(i) >=record(1) && NL(i) <=record(2)
            flag = 1;
            if flag <= m
                if code(1) ~=8
                    bk = code(1);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(1) ~= 8
                    bk = code(1);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            end
            continue
        end
        %区间2
        if NL(i) >=record(2)+1 && NL(i) <=record(3)
            flag = 2;
            if flag <= m
                if code(2) ~=8
                    bk = code(2);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(2) ~= 8
                bk = code(2);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间3
        if NL(i) >=record(3)+1 && NL(i) <=record(4)
            flag = 3;
            if flag <= m
                if code(3) ~=8
                    bk = code(3);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(3) ~= 8
                bk = code(3);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间4
        if NL(i) >=record(4)+1 && NL(i) <=record(5)
            flag = 4;
            if flag <= m
                if code(4) ~=8
                    bk = code(4);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(4) ~= 8
                bk = code(4);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间5
        if NL(i) >=record(5)+1 && NL(i) <=record(6)
            flag = 5;
            if flag <= m
                if code(5) ~=8
                    bk = code(5);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(5) ~= 8
                bk = code(5);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间6
        if NL(i) >=record(6)+1 && NL(i) <=record(7)
            flag = 6;
            if flag <= m
                if code(6) ~=8
                    bk = code(6);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(6) ~= 8
                bk = code(6);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间7
        if NL(i) >=record(7)+1 && NL(i) <=record(8)
            flag = 7;
            if flag <= m
                if code(7) ~=8
                    bk = code(7);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(7) ~= 8
                bk = code(7);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间8
        if NL(i) >=record(8)+1 && NL(i) <=record(9)
            flag = 8;
            if flag <= m
                if code(8) ~=8
                    bk = code(8);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(8) ~= 8
                bk = code(8);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间9
        if NL(i) >=record(9)+1 && NL(i) <=record(10)
            flag = 9;
            if flag <= m
                if code(9) ~=8
                    bk = code(9);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(9) ~= 8
                bk = code(9);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间10
        if NL(i) >=record(10)+1 && NL(i) <=record(11)
            flag = 10;
            if flag <= m
                if code(10) ~=8
                    bk = code(10);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(10) ~= 8
                bk = code(10);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间11
        if NL(i) >=record(11)+1 && NL(i) <=record(12)
            flag = 11;
            if flag <= m
                if code(11) ~=8
                    bk = code(11);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(11) ~= 8
                bk = code(11);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间12
        if NL(i) >=record(12)+1 && NL(i) <=record(13)
            flag = 12;
            if flag <= m
                if code(12) ~=8
                    bk = code(12);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(12) ~= 8
                bk = code(12);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间13
        if NL(i) >=record(13)+1 && NL(i) <=record(14)
            flag = 13;
            if flag <= m
                if code(13) ~=8
                    bk = code(13);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(13) ~= 8
                bk = code(13);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间14
        if NL(i) >=record(14)+1 && NL(i) <=record(15)
            flag = 14;
            if flag <= m
                if code(14) ~=8
                    bk = code(14);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(14) ~= 8
                bk = code(14);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间15
        if NL(i) >=record(15)+1 && NL(i) <=record(16)
            flag = 15;
            if flag <= m
                if code(15) ~=8
                    bk = code(15);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(15) ~= 8
                bk = code(15);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
        %区间16
        if NL(i) >=record(16)+1
            flag = 16;
            if flag <= m
                if code(16) ~=8
                    bk = code(16);
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed(PE(i),maxD,bk,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                else
                    bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                    p = I(xpos(i),ypos(i));
                    [dEC,delta,markP] = autoEmbed2(PE(i),maxD,p,bit);
                    Iw(xpos(i),ypos(i)) = markP;
                    EC = EC + dEC;
                    ED = ED +delta;
                end
            else
                if code(16) ~= 8
                bk = code(16);
                bit = mod(data(fix(i/255)*500+mod(i,255)),2);
                p = I(xpos(i),ypos(i));
                [dEC,delta,markP] = autoEmbed3(PE(i),bk,p,bit);
                Iw(xpos(i),ypos(i)) = markP;
                EC = EC + dEC;
                ED = ED +delta;
                end
            end
            continue
        end
    end
% end


end