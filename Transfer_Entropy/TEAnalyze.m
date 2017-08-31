clc; clear all; close all;
%% add toolbox and import data
addpath('/Users/madvn/IU/Research/code/TEanalysis/te_matlab_0.5');
%runs = [37,3,33,82,21,76,47,27,5,95,64,46,40,69,91,28,59,83];
runNum = 22;
pathis = strcat('/Users/madvn/IU/Research/code/CategorizationAgent/results/noTaxis/n4/',num2str(runNum));
addpath(pathis);
load raster.mat;

%% import, prepare and analyze data
for r=1:24
    disp(r)
    % TE computation
    asdf = SparseToASDF(raster0{r}, 1);
    [peakTE] = ASDFTE(asdf,1:20);
    TE0{r} = peakTE;
    
    asdf = SparseToASDF(raster1{r}, 1);
    [peakTE] = ASDFTE(asdf,1:20);
    TE1{r} = peakTE;
end

save(strcat(pathis,'/TENets.mat'),'TE0','TE1');
clusterTENets
%% results
% for i=1:3
%     for j=1:3
%         subplot(3,3,(i-1)*3+j);
%         v = (TEdelays(i,j,:)); v=(v(:));v(v<1e-4) = 0;
%         plot(v);if i~=j;ylim([0,2e-3]);end;
%         W(i,j) = sum(v);
%     end
% end
% disp('W =')
% disp(W);