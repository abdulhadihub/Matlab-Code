% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');

% Convert the image to grayscale
gray_scale = rgb2gray(original_image);

% Define the Sobel operator kernels
sobel_x = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
sobel_y = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

% Apply Sobel operators using imfilter
gradient_x = imfilter(double(gray_scale), sobel_x);
gradient_y = imfilter(double(gray_scale), sobel_y);

% Compute the gradient magnitude
gradient_magnitude = sqrt(gradient_x.^2 + gradient_y.^2);

% Display the gradient magnitude
imshow(gradient_magnitude, []);

% You can adjust the scale and offset if needed:
% gradient_magnitude = gradient_magnitude * scale + offset;
