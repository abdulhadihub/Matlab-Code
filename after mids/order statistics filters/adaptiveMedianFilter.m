function output_image = adaptiveMedianFilter(input_image, max_window_size)
    % Convert the input image to double for better accuracy
    input_image = double(input_image);

    % Get the size of the input image
    [rows, cols] = size(input_image);

    % Initialize the output image
    output_image = zeros(rows, cols);

    % Iterate through each pixel in the image
    for i = 1:rows
        for j = 1:cols
            window_size = 3; % Initial window size
            
            while window_size <= max_window_size
                % Extract the local window around the current pixel
                row_start = max(1, i - floor(window_size/2));
                row_end = min(rows, i + floor(window_size/2));
                col_start = max(1, j - floor(window_size/2));
                col_end = min(cols, j + floor(window_size/2));

                % Extract the local region
                local_region = input_image(row_start:row_end, col_start:col_end);

                % Calculate the median of the local region
                local_median = median(local_region(:));

                % Check if the center pixel is an impulse noise
                if input_image(i, j) < min(local_region(:)) || input_image(i, j) > max(local_region(:))
                    % If it is impulse noise, replace it with the local median
                    output_image(i, j) = local_median;
                    break; % Break out of the while loop
                else
                    % If not impulse noise, move to the next window size
                    window_size = window_size + 2; % Increase by 2 for odd-sized windows
                end
            end
            
            % If the window size exceeds the specified maximum, use the original pixel value
            if window_size > max_window_size
                output_image(i, j) = input_image(i, j);
            end
        end
    end

    % Convert the output image back to uint8 for display
    output_image = uint8(output_image);
end
