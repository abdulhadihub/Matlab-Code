function output_image = local_histogram_equalization(input_image, window_size)
    % Convert the input image to grayscale if it's in color
    if size(input_image, 3) == 3
        input_image = rgb2gray(input_image);
    end
    
    [rows, cols] = size(input_image);
    half_window = floor(window_size / 2);
    
    input_image = im2double(input_image);
    % Pad the input image to handle border pixels
    padded_image = padarray(input_image, [half_window, half_window], 'replicate');
    
    % Initialize the output image
    output_image = zeros(rows, cols);
    
    % Apply local histogram equalization
    for i = 1:rows
        for j = 1:cols
            % Extract the local window
            local_window = padded_image(i:i+2*half_window, j:j+2*half_window);
            
            % Compute the histogram of the local window
            local_histogram = imhist(local_window);
            
            % Compute the cumulative distribution function (CDF)
            local_cdf = cumsum(local_histogram) / numel(local_window);
            
            % Map the pixel value using manual interpolation
            input_pixel_value = input_image(i, j);
            lower_index = find(local_cdf <= input_pixel_value / 255, 1, 'last');
            upper_index = find(local_cdf > input_pixel_value / 255, 1);
            
            if ~isempty(lower_index) && ~isempty(upper_index)
                lower_value = (lower_index - 1) / 255;
                upper_value = upper_index / 255;
                
                % Linear interpolation
                interpolated_value = lower_value + (upper_value - lower_value) * (input_pixel_value / 255 - local_cdf(lower_index)) / (local_cdf(upper_index) - local_cdf(lower_index));
                
                % Map the interpolated value back to the range [0, 255]
                output_image(i, j) = uint8(255 * interpolated_value);
            else
                % Handle cases where interpolation indices are not found
                output_image(i, j) = 0;
            end
        end
    end
end
