% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\017.jpeg');  % Replace with the path to your image

% Convert the image to grayscale
A = rgb2gray(original_image);

% Get the dimensions of the image
[rows, cols] = size(A);

% Initialize an array to store the histogram
histogram = zeros(1, 256);

% Calculate the histogram
for i = 1:rows
    for j = 1:cols
        pixel_value = A(i, j);
        histogram(pixel_value + 1) = histogram(pixel_value + 1) + 1;
    end
end

% Display the histogram
bar(0:255, histogram);
title('Image Histogram');
xlabel('Pixel Value');
ylabel('Frequency');
