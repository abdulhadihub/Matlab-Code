% Load an image (replace 'your_image.jpg' with the actual image file)
originalImage = imread('C:\Users\Abdul Hadi\Desktop\stars.jpg');

% Display the original image
subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');

% Define the filter window size (e.g., 3x3)
windowSize = 3;

% Apply Minimum Filter
minFiltered = applyMinimumFilter(originalImage, windowSize);
subplot(2, 2, 2);
imshow(uint8(minFiltered));
title('Minimum Filter');

% Apply Maximum Filter
maxFiltered = applyMaximumFilter(originalImage, windowSize);
subplot(2, 2, 3);
imshow(uint8(maxFiltered));
title('Maximum Filter');

% Apply Median Filter
medianFiltered = applyMedianFilter(originalImage, windowSize);
subplot(2, 2, 4);
imshow(uint8(medianFiltered));
title('Median Filter');

% Function to apply Minimum Filter
function filteredImage = applyMinimumFilter(image, windowSize)
    [rows, cols] = size(image);
    halfWindowSize = floor(windowSize / 2);
    filteredImage = zeros(rows, cols);

    for i = 1 + halfWindowSize : rows - halfWindowSize
        for j = 1 + halfWindowSize : cols - halfWindowSize
            window = image(i - halfWindowSize : i + halfWindowSize, j - halfWindowSize : j + halfWindowSize);
            filteredImage(i, j) = min(window(:));
        end
    end
end

% Function to apply Maximum Filter
function filteredImage = applyMaximumFilter(image, windowSize)
    [rows, cols] = size(image);
    halfWindowSize = floor(windowSize / 2);
    filteredImage = zeros(rows, cols);

    for i = 1 + halfWindowSize : rows - halfWindowSize
        for j = 1 + halfWindowSize : cols - halfWindowSize
            window = image(i - halfWindowSize : i + halfWindowSize, j - halfWindowSize : j + halfWindowSize);
            filteredImage(i, j) = max(window(:));
        end
    end
end

% Function to apply Median Filter
function filteredImage = applyMedianFilter(image, windowSize)
    [rows, cols] = size(image);
    halfWindowSize = floor(windowSize / 2);
    filteredImage = zeros(rows, cols);

    for i = 1 + halfWindowSize : rows - halfWindowSize
        for j = 1 + halfWindowSize : cols - halfWindowSize
            window = image(i - halfWindowSize : i + halfWindowSize, j - halfWindowSize : j + halfWindowSize);
            filteredImage(i, j) = median(window(:));
        end
    end
end
