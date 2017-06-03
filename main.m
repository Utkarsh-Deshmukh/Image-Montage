clear
close all
clc

bg_dir = 'randomImages';
coverImg = rgb2gray(imread('minions.jpg'));
coverImg = imresize(coverImg,2);        % Increasing the resolution of the coverImage
L = dir(fullfile(bg_dir,'*.jpg'));
[rows cols] = size(coverImg);


%% This part is to create the averages matrix. If already created, comment this part and load the matrix
% for(i=1:length(L))
%     img = imread(fullfile(bg_dir,L(i).name));
%     img = imresize(img,0.5);
%     imwrite(img, fullfile(bg_dir,L(i).name));
%     averages(i) = mean(img(:));
% end

load averages

%%
rows = 32*floor(rows/32);               % Montage images are of size 64x64. Hence, making the dimensions of coverImage a factor of 64
cols = 32*floor(cols/32);

output = zeros(rows,cols);

count = 0; maxCount = (rows*cols)/(32*32);
try
    delete(h)
end
h = waitbar(0,'Initializing waitbar...');
for(i=1:32:rows)
    for(j=1:32:cols)
        count = count + 1;
        waitbar(count/maxCount,h);
        block = coverImg(i:i+31,j:j+31);
        blockMean = mean(block(:));
        
        meanDiff = abs(averages - blockMean);
        [val ind] = sort(meanDiff);
        ind = ind(randi(5));
        
        output(i:i+31,j:j+31) = imread(fullfile(bg_dir,L(ind).name));
    end
end

imshow(output,[]);
