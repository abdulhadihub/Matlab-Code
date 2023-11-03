% Load the image
original_image = imread('C:\Users\Abdul Hadi\Desktop\test images\006.jpeg');

% Convert the image to grayscale
A = rgb2gray(im2double(original_image));

[R, C] = size(A);
B = zeros(R, C);

for i=1:1:R
    for j=1:1:C
        B(i,j) = exp(1+A(i,j));
    end
end

figure;
imshow(B);

% Create a figure for the plot
figure;
% Plot the relationship between original pixel values (A) and transformed values (B)
plot(A(:), B(:), '.');
title('Transformation Relationship');
xlabel('Original Pixel Values (x)');
ylabel('Transformed Values (f(x))');
show;