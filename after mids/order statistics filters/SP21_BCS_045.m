% STEP 1 - DEFINING FUNCTION
function SP21_BCS_045(filename, SxySize, K0, K1, K2)
    % STEP 2 - Check if optional parameters are not provided, use default values
    if nargin < 5
        SxySize = 3;  % Default size for Sxy
        K0 = 100;       % Default value for K0
        K1 = 50;       % Default value for K1
        K2 = 2;       % Default value for K2
    end

    % STEP 3 - Read the input image
    originalImage = imread(filename);
    % Convert image to grayscale
    grayImage = im2double(rgb2gray(originalImage));
    
    % Calculating global mean & standard deviation of original image
    meanGlobal = mean(grayImage(:));
    stdGlobal = std(grayImage(:));

    % Get image size
    [rows, cols] = size(grayImage);

    % Initialize enhanced image
    enhancedImage = zeros(rows, cols);

    % Loop through each pixel in the image
    for i = 1:rows
        for j = 1:cols
            % Calculate the row indices for the sub-image
            rowStart = max(1, i - SxySize);
            rowEnd = min(rows, i + SxySize);
            % Calculate the column indices for the sub-image
            colStart = max(1, j - SxySize);
            colEnd = min(cols, j + SxySize);
            % Extract the sub-image using the calculated indices
            subImage = grayImage(rowStart:rowEnd, colStart:colEnd);

            % STEP 4 - Calculate local mean & standard deviation of
            % sub-image
            meanSxy = mean(subImage(:));
            stdSxy = std(subImage(:));
            
            % Check the enhancement criteria based on mean and standard deviation
            if (meanSxy <= K0*meanGlobal) && (stdSxy >= K1*stdGlobal) && (stdSxy <= K2*stdGlobal)
                enhancedImage(i, j) = grayImage(i, j) * 2;  % Enhance pixel
            else
                enhancedImage(i, j) = grayImage(i, j);  % Keep pixel unchanged
            end
        end
    end

    % STEP 5 - Display original and enhanced images
    figure;
    subplot(1, 2, 1), imshow(grayImage, []), title('Original Image');
    subplot(1, 2, 2), imshow(enhancedImage, []), title('Enhanced Image');

    % STEP 6 - Save images
    imwrite(grayImage, 'originalImage.bmp');
    imwrite(enhancedImage, 'enhancedImage.jpeg');
end
