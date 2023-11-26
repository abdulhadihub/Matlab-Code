% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');

% Convert the image to grayscale
A = rgb2gray(original_image);

imgFFT = fft2(double(A));

img2 = ifft2(imgFFT);
s = fftshift(log(1+abs(imgFFT)));

imshow(img2);

