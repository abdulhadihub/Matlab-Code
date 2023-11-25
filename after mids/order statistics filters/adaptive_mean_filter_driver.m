inputImage = imread('C:\Users\Abdul Hadi\Desktop\test images\014.jpeg');
windowSize = 3; % Adjust as needed
threshold = 20; % Adjust as needed

saltPepperProbability = 0.2;
noisyImage = imnoise(inputImage, 'salt & pepper', saltPepperProbability);
outputImage = adaptiveArithmeticMeanFilter(noisyImage, windowSize, threshold);

% Display the original and filtered images
figure;
subplot(3, 1, 1);
imshow(inputImage);
title('Original Image');

subplot(3, 1, 2);
imshow(noisyImage);
title('Noisy Image');

subplot(3, 1, 3);
imshow(outputImage);
title('Filtered Image');
