% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');

% Convert the image to grayscale
gray_scale = rgb2gray(original_image);

% Create Prewitt gradient operators
dx = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
dy = [-1, -1, -1; 0, 0, 0; 1, 1, 1];

% Apply the gradient operators using imfilter
gradient_x = imfilter(double(gray_scale), dx);
gradient_y = imfilter(double(gray_scale), dy);

% Combine the gradient components to obtain gradient magnitude
gradient_magnitude = sqrt(gradient_x.^2 + gradient_y.^2);

% Display the gradient magnitude
figure
imshow(uint8(gradient_magnitude));
