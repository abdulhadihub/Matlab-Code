% Load the RGB image
rgbImage = imread('C:\Users\Abdul Hadi\Desktop\test images\002.jpeg');

% Extract individual color channels
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);

% Display each color channel separately
figure;

subplot(2, 2, 1);
imshow(rgbImage);
title('Original RGB Image');

subplot(2, 2, 2);
imshow(redChannel);
title('Red Channel');

subplot(2, 2, 3);
imshow(greenChannel);
title('Green Channel');

subplot(2, 2, 4);
imshow(blueChannel);
title('Blue Channel');
