function output_image = adaptive_histogram_equalization(input_image, window_size,k0,k1,k2)
    input_image = im2double(rgb2gray(input_image));
    
    global_mean = mean(input_image(:));
    global_std = std(input_image(:));
    
    [rows, cols] = size(input_image);
    half_window = floor(window_size / 2);
    
    % Pad the input image to handle border pixels
    padded_image = padarray(input_image, [half_window, half_window], 'replicate');
    
    % Initialize the output image
    output_image = zeros(rows, cols);
    
    % Apply local histogram equalization
    for i = 1:rows
        for j = 1:cols
            % Extract the local window
            local_window = padded_image(i:i+window_size-1, j:j+window_size-1);
            
            local_mean = mean(local_window(:));
            local_std = std(local_window(:));
            
            if (local_mean < (k0*global_mean)) && (k2*global_std < local_std) && (local_std < k1*global_std)
                % Apply histogram equalization to the local window
                equalized_window = histeq(local_window);

                % Place the equalized window back into the image
                output_image(i:i+window_size-1, j:j+window_size-1) = equalized_window;
            end
        end
    end