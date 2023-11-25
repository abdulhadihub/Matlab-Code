inputImage = zeros(200,200,3);
outputImage = zeros(200,200,3);

% inputImage Q1 - red
inputImage(1:100,1:100,1) = 255;

% inputImage Q2 - yellow
inputImage(1:100,101:200,1) = 255;
inputImage(1:100,101:200,2) = 255;
inputImage(1:100,101:200,3) = 0;

% inputImage Q3 - green
inputImage(101:200,1:100,2) = 255;

% inputImage Q4 - blue
inputImage(101:200,101:200,3) = 255;

% outputImage Q1 - Yellow
outputImage(1:100, 1:100, 1) = 255;
outputImage(1:100, 1:100, 2) = 255;

% outputImage Q2 - Middle Gray
outputImage(1:100, 101:200, :) = 181;

% outputImage Q3 - Blue
outputImage(101:200, 1:100, 3) = 255;

% outputImage Q4 - Magenta
outputImage(101:200, 101:200, 1) = 255;
outputImage(101:200, 101:200, 3) = 255;

figure;
subplot(1,2,1);
imshow(inputImage, []);
title("Input Image");

subplot(1,2,2);
imshow(outputImage, []);
title("Output Image");
