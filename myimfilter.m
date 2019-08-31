function img = myimfilter(f, w)
[rows, cols] = size(f);
% add padding, and give value as zeros
% filter 3x3 => +2
g = zeros (rows + 2, cols + 2);
% filter 5x5 => +4
% filter 7x7 => +6
%g = zeros (rows + 6, cols + 6);

% save f in g
for i = 1:rows
    for j = 1:cols
        g(i+1, j+1) = f(i, j);
    end
end
% apply the filter to each px of the original image
for i = 1:rows
    for j = 1:cols
        img(i,j) =...
             g(i,j+0)*w(1,1) + g(i+1,j)*w(2,1) + g(i+2,j)*w(3,1)...
           + g(i,j+1)*w(1,2) + g(i+1,j+1)*w(2,2) + g(i+2,j+1)*w(3,2)...
           + g(i,j+2)*w(1,3) + g(i+1,j+2)*w(2,3) + g(i+2,j+2)*w(3,3);
    end
end
img = uint8(img);
end

% test the function
% w = [1/9, 1/9, 1/9; 1/9, 1/9, 1/9; 1/9, 1/9, 1/9];
% breast = imread('image/breast.png');
% filteredImg = myimfilter(breast, w);
% figure
% subplot(1,2,1);
% imshow(breast);
% title("Original Img");
% subplot(1,2,2);
% imshow(filteredImg);
% title("Filtered Img");
