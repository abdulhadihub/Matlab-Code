% Read the image
originalImage = imread('C:\Users\Abdul Hadi\Desktop\stars.jpg');

% Convert to grayscale if needed
grayImage = rgb2gray(originalImage);

% Choose a threshold (adjust this value accordingly)
threshold = 128; % For an 8-bit grayscale image (0-255 range)

% Create a binary image manually
binaryImage = grayImage > threshold;

% Display the binarized image (optional)
imshow(binaryImage);
title('Binarized Image');

% Save the binarized image (optional)
imwrite(binaryImage, 'binarized_image.jpg');
