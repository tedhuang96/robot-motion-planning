% clear;clc

% load('test1.mat') % nominalrange [25, 50]
% load('test2.mat') % nominalrange [15, 30]
% load('test2_2.mat') % nominalrange [15, 30]

% load('test_3.mat') % nominalrange [15, 30]
% load('test_5_2000.mat')
% load('test1.mat')
% load('test5_s5plus2square.mat')
load('test7_1000.mat')
figure;
stateCountList = [];
for i = 1:prod(size(stateCount))
    stateCountList = [stateCountList, stateCount(i)];
end
plot(stateCountList)


fprintf('state visit count == 0\n')

listLarger = find(stateCountList==0);
for i = listLarger
    [a,b,c,d,e,f]=ind2sub(size(Q),i);
%     if a == 1
%         fprintf('%.0f, %.0f, %.0f, %.0f, %.0f, count: %.0f\n', a,b,c,d,e, stateCountList(i));
%     end
    [tmp, ff] = max(Q(a,b,c,d,e,:));
    fprintf('%.0f, %.0f, %.0f, %.0f, %.0f,%.0f, count: %.0f, Q: %.2f maxQ: %.2f, argmaxQ: %.0f\n', a,b,c,d,e,f, stateCountList(i), Q(a,b,c,d,e,f), max(Q(a,b,c,d,e,:)), ff);
end

fprintf('state visit count == 0 and s1 = 0\n')

listLarger = find(stateCountList==0);
for i = listLarger
    [a,b,c,d,e,f]=ind2sub(size(Q),i);
    if a == 1
        [tmp, ff] = max(Q(a,b,c,d,e,:));
        fprintf('%.0f, %.0f, %.0f, %.0f, %.0f,%.0f, count: %.0f, Q: %.2f maxQ: %.2f, argmaxQ: %.0f\n', a,b,c,d,e,f, stateCountList(i), Q(a,b,c,d,e,f), max(Q(a,b,c,d,e,:)), ff);
    end
end

sum(Q(:)~=0)
sum(Q(:)==0)