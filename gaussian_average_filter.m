% Read the image and convert it to grayscale
a = rgb2gray(imread('C:\Users\Abdul Hadi\Desktop\070.jpg'));

% Define the Gaussian filter parameters
filterSize = 5;  % Adjust this value for the desired filter size
sigma = 1.0;     % Adjust this value for the desired Gaussian standard deviation

% Create a Gaussian filter kernel
filter = fspecial('gaussian', filterSize, sigma);

% Apply the Gaussian filter to the image
b = imfilter(a, filter, 'replicate');  % 'replicate' boundary handling

% Display the original and filtered images
figure;
subplot(1, 2, 1);
imshow(a, []);
title('Original Image');

subplot(1, 2, 2);
imshow(b, []);
title('Filtered Image');
