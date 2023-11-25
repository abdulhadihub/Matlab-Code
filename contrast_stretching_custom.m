% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');

% Convert the image to grayscale
A = rgb2gray(original_image);

% Get the dimensions of the grayscale image
[R, C] = size(A);

% Find the minimum and maximum pixel values in the grayscale image
rmin = double(min(A(:)));
rmax = double(max(A(:)));

% Define the new range
smin = 40;
smax = 200;

% Create a new image B for the mapped values
B = zeros(R, C, 'double');

% Perform the value mapping
for i = 1:R
    for j = 1:C
        B(i, j) = ((double(A(i, j)) - rmin) * (smax - smin) / (rmax - rmin)) + smin ;
    end
end

% Convert the mapped values to uint8
B = uint8(B);

% Display the original and mapped images
figure;
subplot(1, 2, 1);
imshow(A);
title('Original Image');

subplot(1, 2, 2);
imshow(B);
title('Mapped Image');
