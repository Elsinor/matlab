function gray = grayscale(imgSource, algorithm, show)

% Default Args
if nargin < 3
    show = false;
end

algorithm = lower(algorithm);

%
execAlg = false;
  
% Size from source
[h, w, ~] = size(imgSource);

% Convert source to double to use gammaCorrection
imgSource = double(imgSource);

% Preallocation
gray = zeros(h, w, 'double');

switch algorithm
    case 'intensity'
        execAlg = true;
        for j = 1 : h
            for i = 1 : w
                r = imgSource(j, i, 1);
                g = imgSource(j, i, 2);
                b = imgSource(j, i, 3);
                gray(j, i) = round((r+g+b)/3);
            end
        end    
    case 'gleam'
        execAlg = true;
        for j = 1 : h
            for i = 1 : w
                r = grayScaleGammaCorrection(imgSource(j, i, 1));
                g = grayScaleGammaCorrection(imgSource(j, i, 2));
                b = grayScaleGammaCorrection(imgSource(j, i, 3));
                gray(j, i) = round((r+g+b)/3);
            end
        end 
    case 'luminance'
        execAlg = true;
        for j = 1 : h
            for i = 1 : w
                r = imgSource(j, i, 1);
                g = imgSource(j, i, 2);
                b = imgSource(j, i, 3);
                gray(j, i) = round(0.3*r + 0.59*g + 0.11*b);
            end
        end
    case 'luma'
        execAlg = true;
        for j = 1 : h
            for i = 1 : w
                r = grayScaleGammaCorrection(imgSource(j, i, 1));
                g = grayScaleGammaCorrection(imgSource(j, i, 2));
                b = grayScaleGammaCorrection(imgSource(j, i, 3));
                gray(j, i) = round(0.2126*r + 0.7152*g + 0.0722*b);
            end
        end
    case 'lightness'
        execAlg = true;
        for j = 1 : h
            for i = 1 : w
                r = imgSource(j, i, 1);
                g = imgSource(j, i, 2);
                b = imgSource(j, i, 3);
                Y = 0.2126*r + 0.7152*g + 0.0722*b;
                gray(j, i) = round((116*grayScaleLightnessCorrection(Y) - 16)/100);
            end
        end    
end

% Convert to uint8 to visualize
gray = uint8(gray);

if show == true && execAlg == true
    figure; imshow(gray);
    titleString = ['Grayscaled with ' upper(algorithm)];
    title(titleString);
elseif execAlg == false
        fprintf(strcat(algorithm, ' is not a valid algorithm'));  
end 
