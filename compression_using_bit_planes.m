% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\019.jpeg');  % Replace with the path to your image

% Convert the image to grayscale
A = rgb2gray(im2double(original_image));

% Calculate the dimensions of the original image
[rows, cols] = size(A);

% Calculate the dimensions of the compressed image
compressed_rows = rows / 2;
compressed_cols = cols / 2;

% Compress the image using the 4 MSB values of 4 neighboring pixels
compressed_image = zeros(uint8(compressed_rows), uint8(compressed_cols));

for i = 1:compressed_rows
    for j = 1:compressed_cols
        % Calculate the starting row and column for the 4x4 block
        start_row = (i - 1) * 2 + 1;
        start_col = (j - 1) * 2 + 1;

        % Extract the 4 MSB values from the 4 pixels in the block
        msb_values = A(start_row:start_row + 3, start_col:start_col + 3);
        msb_values = bitshift(msb_values, -4);  % Right-shift to keep the MSB
        
        % Calculate the average of the 4 MSB values and set it as the pixel value
        compressed_image(i, j) = mean(msb_values(:));
    end
end

% Downsample the compressed image to 100x100 using imresize
compressed_image = imresize(compressed_image, [100, 100]);

% Display the original and compressed images
subplot(1, 2, 1);
imshow(A);
title('Original Image');

subplot(1, 2, 2);
imshow(compressed_image, []);
title('Compressed Image');
