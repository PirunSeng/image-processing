function [] = exercise1()
    w = [1/9, 1/9, 1/9; 1/9, 1/9, 1/9; 1/9, 1/9, 1/9];
    % your image may be in different path
    breast = imread('image/breast.png');
    filteredImg = myimfilter(breast, w);
    figure
    subplot(1,3,1);
    imshow(breast);
    title("Original Img");
    subplot(1,3,2);
    imshow(filteredImg);
    title("myimfilter Img");
    subplot(1,3,3);
    imshow(imfilter(breast, w));
    title("Matlab imfilter Img");
end