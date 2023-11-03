function mySecondAssignment(filename, n)

    % STEP 1 - Read the input image
    originalImage = imread(filename);

    % STEP 2 - Convert the image to grayscale if it's in color
        grayscaleImage = rgb2gray(originalImage);

    % STEP 3 - Add salt and pepper noise to the grayscale image
    noisyImage = imnoise(grayscaleImage, 'salt & pepper');

    % STEP 4 - Display the original and noisy images
    figure(1)
    subplot(1, 2, 1);
    imshow(originalImage);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(noisyImage);
    title('Noisy Image');

    % STEP 5 - Apply an n x n Averaging filter & Save Image
    averagedImage = myAveragingFilter(noisyImage, n);
    imwrite(averagedImage, 'denoisedimage_averaging.bmp');

    % STEP 6 - Apply an n x n Median filter & Save Image
    medianedImage = myMedianFilter(noisyImage, n);
    imwrite(medianedImage, 'denoisedimage_median.jpeg');

    % STEP 7 - Display the filtered images
    figure(2)
    subplot(1, 2, 1);
    imshow(averagedImage);
    % AVERAGING FILTER OBSERVATION:
    % Averaging filter blurs image, including the noise but 
    % is unable to remove it leaving blemishes in the image
    title('Averaging Filtered Image');
    
    subplot(1, 2, 2);
    imshow(medianedImage);
     % MEDIAN FILTER OBSERVATION:
    % Median filter is very effective at removing at salt and pepper noise 
    % it outputs image which is close to the original image while retaining
    % details
    title('Median Filtered Image');

end

% Averaging filter function
function outputImage = myAveragingFilter(inputImage, n)
    [rows, cols] = size(inputImage);
    padSize = floor(n / 2);

    % Initialize the output image
    outputImage = zeros(rows, cols, 'uint8');

    % Pad the input image
    paddedImage = zeros(rows + 2 * padSize, cols + 2 * padSize, 'double');
    paddedImage(padSize + 1:padSize + rows, padSize + 1:padSize + cols) = double(inputImage);

    % Apply the averaging filter
    for i = 1:rows
        for j = 1:cols
            neighborhood = paddedImage(i:i + n - 1, j:j + n - 1);
            sumOfNeighbors = sum(neighborhood(:));
            outputImage(i, j) = uint8(sumOfNeighbors / (n * n));
        end
    end
end

% Median filter function
function outputImage = myMedianFilter(inputImage, n)
    [rows, cols] = size(inputImage);
    padSize = floor(n / 2);

    % Initialize the output image
    outputImage = zeros(rows, cols, 'uint8');

    % Pad the input image
    paddedImage = zeros(rows + 2 * padSize, cols + 2 * padSize, 'uint8');
    paddedImage(padSize + 1:padSize + rows, padSize + 1:padSize + cols) = inputImage;

    % Apply the median filter
    for i = 1:rows
        for j = 1:cols
            neighborhood = paddedImage(i:i + n - 1, j:j + n - 1);
            % Reshape the neighborhood into a 1D array and sort it
            neighborhood = reshape(neighborhood, [1, n * n]);
            sortedNeighborhood = sort(neighborhood);
            % Find the median value
            medianIndex = floor((n * n + 1) / 2);
            outputImage(i, j) = sortedNeighborhood(medianIndex);
        end
    end
end