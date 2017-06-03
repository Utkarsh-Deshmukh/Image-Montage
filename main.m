clear
close all
clc

bg_dir = 'randomImages';
coverImg = rgb2gray(imread('minions.jpg'));
coverImg = imresize(coverImg,5);        % Increasing the resolution of the coverImage
L = dir(fullfile(bg_dir,'*.jpg'));
[rows cols] = size(coverImg);


%% This part is to create the averages matrix. If already created, comment this part and load the matrix
% for(i=1:length(L))
%     img = imread(fullfile(bg_dir,L(i).name));
%     averages(i) = mean(img(:));
% end

load averages

%%
rows = 64*floor(rows/64);               % Montage images are of size 64x64. Hence, making the dimensions of coverImage a factor of 64
cols = 64*floor(cols/64);

output = zeros(rows,cols);
for(i=1:64:rows)
    for(j=1:64:cols)
        block = coverImg(i:i+63,j:j+63);
        blockMean = mean(block(:));
        
        meanDiff = abs(averages - blockMean);
        [val ind] = sort(meanDiff);
        ind = ind(randi(1));
        
        output(i:i+63,j:j+63) = imread(fullfile(bg_dir,L(ind).name));
    end
end

imshow(output,[]);
