% Load the low-contrast image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\017.jpeg');  % Replace with the path to your image

% Convert the image to grayscale
A = rgb2gray(im2double(original_image));

% Calculate the minimum and maximum pixel values
min_val = min(A(:));
max_val = max(A(:));

% Calculate the probability of each pixel value
pixel_counts = imhist(A);
pixel_probabilities = pixel_counts / sum(pixel_counts);

% Determine the pixel value with the highest probability
[max_probability, max_probability_pixel] = max(pixel_probabilities);

% Expand pixels with the highest probability using piece-wise linear transformation
expanded_image = A;

for i = 1:numel(A)
    if A(i) == max_probability_pixel
        expanded_image(i) = max_val;
    else
        expanded_image(i) = (A(i) - min_val) * ((max_val - min_val) / (1 - max_probability)) + min_val;
    end
end

% Display the original and enhanced images
subplot(1, 2, 1);
imshow(A);
title('Original Image');

subplot(1, 2, 2);
imshow(expanded_image);
title('Enhanced Image');

% Create a figure for the plot
figure;
% Plot the relationship between original pixel values (A) and transformed values (B)
plot(A(:), expanded_image(:), '.');
title('Transformation Relationship');
xlabel('Original Pixel Values (x)');
ylabel('Transformed Values (f(x))');
show;