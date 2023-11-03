% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');

% Convert the image to grayscale
gray_scale = rgb2gray(original_image);

% Define the Laplacian filter kernel (3x3 kernel)
%laplacian_filter = [0, 1, 0; 1, -4, 1; 0, 1, 0];
laplacian_filter = [-1,-1,-1;-1,8,-1;-1,-1,-1];


% Apply the Laplacian filter using imfilter
filtered_image = imfilter(gray_scale, laplacian_filter);

% Display the filtered image
imshow(filtered_image, []);

% You can adjust the scale and offset if needed:
% filtered_image = filtered_image * scale + offset;
