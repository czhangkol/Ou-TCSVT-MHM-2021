clear all

clc
seq = zeros(2,50);
index = 1;

for i = 1:16
    for j = 0:16-i
        seq(1,index) = i;
        seq(2,index) = j;
        index = index + 1;
    end
end