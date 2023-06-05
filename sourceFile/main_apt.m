clear all
clc

% drimgfile = ['J:\Matlab_Program\MATLAB\My_Histogram\Multi-His\new\'];
imgdir = dir(['*.bmp']);
fid=fopen('fileName.txt','wt');
performance = zeros(length(imgdir)*2,100);
location_map = zeros(length(imgdir),100);

time = zeros(3*8,50);


for i_img = [1]
    i_img
    img = 2*(i_img-1)+1;
    I = double(imread([imgdir(i_img).name]));
    
    nIndex = 1;
    n2 = 1;
    deltaMax = 6;
    
    
    cell_LM = cell(8,1);
    cell_LMlen = cell(8,1);
    cell_I = cell(8,1);
    for delta = 1:deltaMax
        [LM,bin_LM_len,I1] = LocationMap_varyD(I,delta,0);
        cell_LM{delta,1} = LM;
        cell_LMlen{delta,1} = bin_LM_len;
        cell_I{delta,1} = I1;
    end
    
%         tic
    
    for Capacity = round(512^2*0.2):round(512^2*0.05):round(512^2*0.2);
        Capacity/512^2
        tic
        
        %------------shadow layer
        bestP = zeros(3,1);
        bestCode = zeros(2,16);
        maxMSE = 999999999;
        for delta = 1:deltaMax
            
            I = cell_I{delta,1};
            dir = 0;
            [PE,NL,his,record,pFor,xpos,ypos] = crossPrediction2(I,dir);
            %%%%%%%%%% 辅助信息长度
            Aux1 = 215+4*delta+cell_LMlen{delta,1};
            
            payload = Capacity*0.5+Aux1;
            embedBits = 0;
            MSE = 0;
            
            cumHis = zeros(511,16);
            for ii = 1:16
                cumHis(:,ii) = cumsum(his(:,ii));
            end
            
            maxD = delta;
            tic
            switch maxD
                case 1
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D1(his,cumHis,payload,maxD);
                case 2
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D2(his,cumHis,payload,maxD);
                case 3
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D3(his,cumHis,payload,maxD);
                case 4
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D4(his,cumHis,payload,maxD);
                case 5
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D5(his,cumHis,payload,maxD);
                case 6
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D6(his,cumHis,payload,maxD);
                case 7
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D7(his,cumHis,payload,maxD);
                case 8
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D8(his,cumHis,payload,maxD);
            end
            
            
            codeF = zeros(2,16);
            codeF(1,1:8) = m_out;
            codeF(1,9) = maxD;
            codeF(2,:) = code;
            
            ind_PEH = 1:16;
            A = cell(8,1);
            if maxD > 1
                beginPEH = 1;
                endPEH = 0;
                left = 16;
                for ii = 1:maxD
                    if left <=0
                        break
                    end
                    if m_out(ii) == -1
                        endPEH = 16;
                        left = left - endPEH;
                    else
                        endPEH = endPEH+m_out(ii);
                        left = left - m_out(ii);
                    end
                    A{ii,1} = ind_PEH(beginPEH:endPEH);
                    beginPEH = beginPEH+m_out(ii);
                end
            end
            
            %---------------local optimization for cross layer
            [Iw1,EC,dis] = crossEmbed_varyD(I,payload,codeF(2,:),PE,NL,pFor,record,xpos,ypos,maxD,A);
            embedBits = embedBits + EC - Aux1;
            MSE = MSE + dis;
            
            if dis < maxMSE && embedBits >= Capacity*0.5
            maxMSE = dis;
            Iw = Iw1;
            bestP = [embedBits,MSE,delta];
            bestCode = codeF;
            break
            end
            
        end
        
        delta_opt = bestP(3);
        %------------local optimization
        for delta = delta_opt+1:delta_opt+1
            if delta > 6
                continue
            end
            I = cell_I{delta,1};
            dir = 0;
            [PE,NL,his,record,pFor,xpos,ypos] = crossPrediction2(I,dir);
            %%%%%%%%%% 辅助信息长度
            Aux1 = 215+4*delta+cell_LMlen{delta,1};
            
            payload = Capacity*0.5+Aux1;
            embedBits = 0;
            MSE = 0;
            
            cumHis = zeros(511,16);
            for ii = 1:16
                cumHis(:,ii) = cumsum(his(:,ii));
            end
            
            maxD = delta;
            tic
            switch maxD
                case 1
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D1(his,cumHis,payload,maxD);
                case 2
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D2(his,cumHis,payload,maxD);
                case 3
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D3(his,cumHis,payload,maxD);
                case 4
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D4(his,cumHis,payload,maxD);
                case 5
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D5(his,cumHis,payload,maxD);
                case 6
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D6(his,cumHis,payload,maxD);
                case 7
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D7(his,cumHis,payload,maxD);
                case 8
                    [code,EC_est,ED_est,m_out] = determineN2_Mmn_D8(his,cumHis,payload,maxD);
            end
          
            
            codeF = zeros(2,16);
            codeF(1,1:8) = m_out;
            codeF(1,9) = maxD;
            codeF(2,:) = code;
            
            ind_PEH = 1:16;
            A = cell(8,1);
            if maxD > 1
                beginPEH = 1;
                endPEH = 0;
                left = 16;
                for ii = 1:maxD
                    if left <=0
                        break
                    end
                    if m_out(ii) == -1
                        endPEH = 16;
                        left = left - endPEH;
                    else
                        endPEH = endPEH+m_out(ii);
                        left = left - m_out(ii);
                    end
                    A{ii,1} = ind_PEH(beginPEH:endPEH);
                    beginPEH = beginPEH+m_out(ii);
                end
            end
            
            %---------------local optimization for cross layer
            [Iw1,EC,dis] = crossEmbed_varyD(I,payload,codeF(2,:),PE,NL,pFor,record,xpos,ypos,maxD,A);
            embedBits = embedBits + EC - Aux1;
            MSE = MSE + dis;
            
            if dis < maxMSE && embedBits >= Capacity*0.5
            maxMSE = dis;
            Iw = Iw1;
            bestP = [embedBits,MSE,delta];
            bestCode = codeF;
            end
            
        end
        
        
        
        delta_opt2 = bestP(3);
        %--------------blank layer
        
        cell_LM2 = cell(8,1);
        cell_LMlen2 = cell(8,1);
        cell_I2 = cell(8,1);
        for delta = 1:deltaMax
            [LM,bin_LM_len,Iw1] = LocationMap_varyD(Iw,delta,1);
            cell_LM2{delta,1} = LM;
            cell_LMlen2{delta,1} = bin_LM_len;
            cell_I2{delta,1} = Iw1;
        end
        
        bestP2 = zeros(3,1);
        bestCode2 = zeros(2,16);
        maxMSE2 = 999999999;
        
        for delta = delta_opt2:deltaMax
            
            Iw = cell_I2{delta,1};
            dir = 1;
            
            [PE2,NL2,his2,record2,pFor2,xpos2,ypos2] =circlePrediction2(Iw,dir);
            
            %%%%%%%%%% 辅助信息长度：16*3,a; 4, 255; LM; 18 message; hist para;m,4.
            Aux2 = 215+4*delta+cell_LMlen2{delta,1};
            
            payload = Capacity*0.5+Aux2;
            embedBits = 0;
            MSE = 0;
            
            cumHis2 = zeros(511,16);
            for ii = 1:16
                cumHis2(:,ii) = cumsum(his2(:,ii));
            end
            
            maxD2 = delta;
            
            switch maxD2
                case 1
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D1(his2,cumHis2,payload,maxD2);
                case 2
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D2(his2,cumHis2,payload,maxD2);
                case 3
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D3(his2,cumHis2,payload,maxD2);
                case 4
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D4(his2,cumHis2,payload,maxD2);
                case 5
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D5(his2,cumHis2,payload,maxD2);
                case 6
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D6(his2,cumHis2,payload,maxD2);
                case 7
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D7(his2,cumHis2,payload,maxD2);
                case 8
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D8(his2,cumHis2,payload,maxD2);
            end
            
            codeF2 = zeros(2,16);
            codeF2(1,1:8) = m_out;
            codeF2(1,9) = maxD2;
            codeF2(2,:) = code2;
            
            ind_PEH = 1:16;
            A2 = cell(8,1);
            if maxD2 > 1
                beginPEH = 1;
                endPEH = 0;
                left = 16;
                for ii = 1:maxD2
                    if left <=0
                        break
                    end
                    if m_out(ii) == -1
                        endPEH = 16;
                        left = left - endPEH;
                    else
                        endPEH = endPEH+m_out(ii);
                        left = left - m_out(ii);
                    end
                    
                    A2{ii,1} = ind_PEH(beginPEH:endPEH);
                    beginPEH = beginPEH+m_out(ii);
                end
            end
            
            %---------------local optimization for circle layer
            [Iw1,EC,dis] = circleEmbed_varyD(Iw,payload,codeF2(2,:),PE2,NL2,pFor2,record2,xpos2,ypos2,maxD2,A2);
            embedBits = embedBits + EC - Aux2;
            MSE = MSE + dis;
            
            if dis < maxMSE2 && embedBits >= Capacity*0.5
                maxMSE2 = dis;
                Iw = Iw1;
                bestP2 = [embedBits,MSE,delta];
                bestCode2 = codeF2;
                break
            end
            
            
        end
        
        
        delta_opt2 = bestP2(3);
        
        for delta = delta_opt2+1:delta_opt2+1
            if delta > 6
                continue
            end
            Iw = cell_I2{delta,1};
            dir = 1;
            
            [PE2,NL2,his2,record2,pFor2,xpos2,ypos2] =circlePrediction2(Iw,dir);
            
            %%%%%%%%%% 辅助信息长度：16*3,a; 4, 255; LM; 18 message; hist para;m,4.
            Aux2 = 215+4*delta+cell_LMlen2{delta,1};
            
            payload = Capacity*0.5+Aux2;
            embedBits = 0;
            MSE = 0;
            
            cumHis2 = zeros(511,16);
            for ii = 1:16
                cumHis2(:,ii) = cumsum(his2(:,ii));
            end
            
            maxD2 = delta;
            
            switch maxD2
                case 1
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D1(his2,cumHis2,payload,maxD2);
                case 2
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D2(his2,cumHis2,payload,maxD2);
                case 3
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D3(his2,cumHis2,payload,maxD2);
                case 4
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D4(his2,cumHis2,payload,maxD2);
                case 5
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D5(his2,cumHis2,payload,maxD2);
                case 6
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D6(his2,cumHis2,payload,maxD2);
                case 7
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D7(his2,cumHis2,payload,maxD2);
                case 8
                    [code2,EC2_est,ED2_est,m_out] = determineN2_Mmn_D8(his2,cumHis2,payload,maxD2);
            end
            
            codeF2 = zeros(2,16);
            codeF2(1,1:8) = m_out;
            codeF2(1,9) = maxD2;
            codeF2(2,:) = code2;
            
            ind_PEH = 1:16;
            A2 = cell(8,1);
            if maxD2 > 1
                beginPEH = 1;
                endPEH = 0;
                left = 16;
                for ii = 1:maxD2
                    if left <=0
                        break
                    end
                    if m_out(ii) == -1
                        endPEH = 16;
                        left = left - endPEH;
                    else
                        endPEH = endPEH+m_out(ii);
                        left = left - m_out(ii);
                    end
                    
                    A2{ii,1} = ind_PEH(beginPEH:endPEH);
                    beginPEH = beginPEH+m_out(ii);
                end
            end
            
            %---------------local optimization for circle layer
            [Iw1,EC,dis] = circleEmbed_varyD(Iw,payload,codeF2(2,:),PE2,NL2,pFor2,record2,xpos2,ypos2,maxD2,A2);
            embedBits = embedBits + EC - Aux2;
            MSE = MSE + dis;
            
            if dis < maxMSE2 && embedBits >= Capacity*0.5
                maxMSE2 = dis;
                Iw = Iw1;
                bestP2 = [embedBits,MSE,delta];
                bestCode2 = codeF2;
            end
            
            
        end
        
        delta_final = zeros(2,1);
        delta_final(1) = bestP(3)+2;
        delta_final(2) = bestP2(3)+2;
        embedBits = bestP(1) + bestP2(1);
        MSE = bestP(2) + bestP2(2);
        
        if embedBits < Capacity || 10*log10(255^2*512^2/MSE) < 31
            break
        end
        
        performance(img,nIndex) = embedBits;
        performance(img+1,nIndex) = 10*log10(255^2*512^2/MSE);
        
        time(3*i_img-2,nIndex) = bestP(3)+1;
        time(3*i_img-1,nIndex) = bestP2(3)+1;
        time(3*i_img,nIndex) = toc;
        nIndex = nIndex + 1;
        
    end
        toc
    
end
 



