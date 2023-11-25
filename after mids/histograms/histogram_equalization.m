% Read the original image
originalImage = imread('C:\Users\Abdul Hadi\Desktop\test images\020.jpeg'); 
% Convert the image to grayscale if it's in color
originalImage = rgb2gray(originalImage);

% Display the original image
figure;
subplot(2, 3, 1);
imshow(originalImage);
title('Original Image');

[M,N] = size(originalImage);

histOriginal = imhist(originalImage);

% Normalize the histogram
normalizedHist = histOriginal / (M * N);

% Find the cumulative distribution function (CDF)
cdf = cumsum(normalizedHist);

% Find the Look-Up Table (LUT)
L = 256;
lut = round(cdf * (L - 1));

% Apply histogram equalization
equalizedImage = lut(originalImage + 1);

% Display the equalized image
subplot(2, 3, 2);
imshow(equalizedImage, []);
title('Equalized Image');

% Calculate the histogram of the equalized image
histEqualized = zeros(1, 256);
for i = 1:M
    for j = 1:N
        intensity = equalizedImage(i, j);
        histEqualized(intensity + 1) = histEqualized(intensity + 1) + 1;
    end
end

% Normalize the equalized histogram
normalizedHistEqualized = histEqualized / (M * N);

% Plot the original and equalized histograms
subplot(2, 3, 3);
bar(normalizedHist);
hold on;
bar(normalizedHistEqualized);
hold off;
legend('Original Histogram', 'Equalized Histogram');
title('Histogram Comparison');

% Plot the CDF
subplot(2, 3, 4);
plot(cdf);
title('CDF');


% Perform histogram equalization again to observe the identity slope
secondEqualizedImage = lut(equalizedImage + 1);

% Display the second equalized image
subplot(2, 3, 5);
imshow(secondEqualizedImage, []);
title('Second Equalized Image');

% Plot the CDF for the second equalized image
subplot(2, 3, 6);
plot(cumsum(histcounts(secondEqualizedImage(:), 256)) / numel(secondEqualizedImage));
title('CDF for Second Equalized Image');

% Perform simple contrast stretching on the original image
minIntensity = min(min(originalImage));
maxIntensity = max(max(originalImage));
contrastStretchedImage = zeros(size(originalImage));
originalImage = im2double(originalImage);

for i=1:1:M
    for j =1:1:N
        contrastStretchedImage(i,j) = (((originalImage(i,j) - minIntensity) / (maxIntensity - minIntensity)) * 255);
    end
end


% Display the contrast-stretched image
figure;
subplot(1, 2, 1);
imshow(originalImage,[]);
title('Original Image');

subplot(1, 2, 2);
imshow(contrastStretchedImage, []);
title('Contrast Stretched Image');

