function [] = exercise2()
% a. Read an image
cameraman = imread('cameraman.tif')

% b. Add Salt & Pepper with noise density d = 0.001
d = 0.001;

% c. Add Gaussian Noise with noise density zero mean and 0.001 variance
m = 0; % zero mean
v = 0.001; % variance
gaussianImg = imnoise(cameraman, 'gaussian', m, v);

% d. Perform noise filter on both noisy images by own filter kernel
saltPepperImg = imnoise(cameraman, 'salt & pepper', d);
% filter kernel 3x3
w = [1/16, 2/16, 1/16; 2/16, 4/16, 1/16; 1/16, 2/16, 1/16];
% Median filter, by rotate w 180 degree
ww = rot90(w, 2);

% test Mean filter
meanFiltered = myimfilter(saltPepperImg, w);
meanFiltered2 = myimfilter(gaussianImg, w);

% test Median filter
medianFiltered = myimfilter(saltPepperImg, ww);
medianFiltered2 = myimfilter(gaussianImg, ww);
%{
figure('Name', 'Mean Filter on Salt & Pepper Noise Image');
subplot(1,3,1);
imshow(cameraman);
title('Original')
subplot(1,3,2);
imshow(saltPepperImg);
title('Salt & Pepper');
subplot(1,3,3);
imshow(meanFiltered);
title('Filtered');

figure('Name', 'Mean Filter on Gaussian Noise Image');
subplot(1,3,1);
imshow(cameraman);
title('Original')
subplot(1,3,2);
imshow(gaussianImg);
title('Gaussian');
subplot(1,3,3);
imshow(meanFiltered2);
title('Filtered');

figure('Name', 'Median Filter on Salt & Pepper Noise Image');
subplot(1,3,1);
imshow(cameraman);
title('Original')
subplot(1,3,2);
imshow(saltPepperImg);
title('Salt & Pepper');
subplot(1,3,3);
imshow(medianFiltered);
title('Filtered');

figure('Name', 'Median Filter on Gaussian Noise Image');
subplot(1,3,1);
imshow(cameraman);
title('Original')
subplot(1,3,2);
imshow(gaussianImg);
title('Gaussian');
subplot(1,3,3);
imshow(medianFiltered2);
title('Filtered');
%}

% e. With mean filter, try different filter size 7x7, 15x15, 41x41
sevenBySeven = fspecial('average', 7);
fifteenByFifteen = fspecial('average', 15);
fourtyOneByFourtyOne = fspecial('average', 41);

sevenBySevenFiltered = myimfilter(saltPepperImg, sevenBySeven);
sevenBySevenFiltered2 = myimfilter(gaussianImg, sevenBySeven);
fifteenByFifteenFiltered = myimfilter(saltPepperImg, fifteenByFifteen);
fifteenByFifteenFiltered2 = myimfilter(gaussianImg, fifteenByFifteen);
fourtyOneByFourtyOneFiltered = myimfilter(saltPepperImg, fourtyOneByFourtyOne);
fourtyOneByFourtyOneFiltered2 = myimfilter(gaussianImg, fourtyOneByFourtyOne);

figure('Name', 'Different Mean Filter on Salt & Pepper Image');
subplot(2,3,1);
imshow(cameraman);
title('Original')
subplot(2,3,2);
imshow(meanFiltered);
title('3x3');
subplot(2,3,3);
imshow(sevenBySevenFiltered);
title('7x7');
subplot(2,3,4);
imshow(fifteenByFifteenFiltered);
title('15x15');
subplot(2,3,5);
imshow(fourtyOneByFourtyOneFiltered);
title('41x41');

figure('Name', 'Different Mean Filter on Gaussian Image');
subplot(2,3,1);
imshow(cameraman);
title('Original')
subplot(2,3,2);
imshow(meanFiltered2);
title('3x3');
subplot(2,3,3);
imshow(sevenBySevenFiltered2);
title('7x7');
subplot(2,3,4);
imshow(fifteenByFifteenFiltered2);
title('15x15');
subplot(2,3,5);
imshow(fourtyOneByFourtyOneFiltered2);
title('41x41');

end

