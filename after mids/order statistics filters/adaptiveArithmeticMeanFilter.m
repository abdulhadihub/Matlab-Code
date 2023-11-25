function output_image = adaptiveArithmeticMeanFilter(input_image, window_size, threshold)
    % Convert the input image to double for better accuracy
    input_image = double(input_image);

    % Get the size of the input image
    [rows, cols] = size(input_image);

    % Initialize the output image
    output_image = zeros(rows, cols);

    % Iterate through each pixel in the image
    for i = 1:rows
        for j = 1:cols
            % Extract the local window around the current pixel
            row_start = max(1, i - floor(window_size/2));
            row_end = min(rows, i + floor(window_size/2));
            col_start = max(1, j - floor(window_size/2));
            col_end = min(cols, j + floor(window_size/2));

            % Extract the local region
            local_region = input_image(row_start:row_end, col_start:col_end);

            % Compute the local mean
            local_mean = mean(local_region(:));

            % Check if the pixel value is significantly different from the local mean
            if abs(input_image(i, j) - local_mean) > threshold
                % If significant, use the local mean instead
                output_image(i, j) = local_mean;
            else
                % Otherwise, use the original pixel value
                output_image(i, j) = input_image(i, j);
            end
        end
    end

    % Convert the output image back to uint8 for display
    output_image = uint8(output_image);
end
