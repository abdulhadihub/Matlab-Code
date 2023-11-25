% Read the original image
originalImage = imread('C:\Users\Abdul Hadi\Desktop\test images\020.jpeg'); 

originalImage = rgb2gray(originalImage);

% Display the original image
figure;
subplot(1, 3, 1);
imshow(originalImage);
title('Original Image');

% Define parameters for local histogram equalization
windowSize = 15; % Adjust this based on your requirement
[rows, cols] = size(originalImage);

% Initialize the output image
outputImage = zeros(rows, cols);

% Apply local histogram equalization
for i = 1:rows
    for j = 1:cols
        % Define the local region for each pixel
        rowStart = max(1, i - floor(windowSize / 2));
        rowEnd = min(rows, i + floor(windowSize / 2));
        colStart = max(1, j - floor(windowSize / 2));
        colEnd = min(cols, j + floor(windowSize / 2));
        
        % Extract the local region
        localRegion = originalImage(rowStart:rowEnd, colStart:colEnd);
        
        % Perform histogram equalization on the local region
        localEqualizedRegion = histeq(localRegion);
        
        % Place the equalized local region into the output image
        outputImage(i, j) = localEqualizedRegion(floor(windowSize / 2) + 1, floor(windowSize / 2) + 1);
    end
end

% Display the local histogram equalized image
subplot(1, 3, 2);
imshow(outputImage, []);
title('Local Histogram Equalization');

% Compare with global histogram equalization
globalEqualizedImage = histeq(originalImage);

% Display the globally histogram equalized image
subplot(1, 3, 3);
imshow(globalEqualizedImage);
title('Global Histogram Equalization');

% Adjust subplot positions for better visualization
subplot(1, 3, 1:2);
set(gca, 'Position', get(gca, 'Position') + [0.03, 0, -0.03, 0]);

% Save the images
% imwrite(outputImage, 'local_histogram_equalized_image.jpg');
% disp('Local Histogram Equalized Image Saved as local_histogram_equalized_image.jpg');
% imwrite(globalEqualizedImage, 'global_histogram_equalized_image.jpg');
% disp('Global Histogram Equalized Image Saved as global_histogram_equalized_image.jpg');
