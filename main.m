clear
close all
clc

bg_dir = 'E:\GIT_quality_projects\montage\randomImages';
coverImg = rgb2gray(imread('minions.jpg'));
coverImg = imresize(coverImg,5);
L = dir(fullfile(bg_dir,'*.jpg'));
[rows cols] = size(coverImg);

% for(i=1:length(L))
%     img = imread(fullfile(bg_dir,L(i).name));
%     averages(i) = mean(img(:));
% end

load averages
rows = 64*floor(rows/64);
cols = 64*floor(cols/64);

output = zeros(rows,cols);
for(i=1:64:rows)
    for(j=1:64:cols)
        block = coverImg(i:i+63,j:j+63);
        blockMean = mean(block(:));
        
        meanDiff = abs(averages - blockMean);
        [val ind] = sort(meanDiff);
        ind = ind(randi(5));
        
        output(i:i+63,j:j+63) = imread(fullfile(bg_dir,L(ind).name));
    end
end

imshow(output,[]);
