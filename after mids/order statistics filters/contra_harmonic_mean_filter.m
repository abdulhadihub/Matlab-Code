function output_image = contra_harmonic_mean_filter(input_image, window_size, Q)
    [rows, cols] = size(input_image);
    half_window = floor(window_size / 2);
    
    input_image = im2double(input_image);
    % Pad the input image to handle border pixels
    padded_image = padarray(input_image, [half_window, half_window], 'replicate');
    
    % Initialize the output image
    output_image = zeros(rows, cols);
    
    % Apply the contra-harmonic mean filter
    for i = 1:rows
        for j = 1:cols
            % Extract the window
            window = padded_image(i:i+window_size-1, j:j+window_size-1);
            
            % Calculate the numerator and denominator sums
            numerator = sum(window(:).^(Q + 1));
            denominator = sum(window(:).^Q);
            
            % Avoid division by zero
            if denominator ~= 0
                output_image(i, j) = numerator / denominator;
            else
                output_image(i, j) = 0;
            end
        end
    end
end
