% Using Graph Cuts
% Foreground and Background Marking

clc
clear all
close all
warning off
fontSize = 20;
RGB = imread('/Users/marcjabbour/Desktop/SeniorYear/Fall/Image_Processing/banana.jpeg');
subplot(1,3,1);
imshow(RGB);
title('Original Image');
[BW,maskedImage] = segmentImage(RGB);
subplot(1,3,2);
imshow(BW);
title('Segmented Binary Image');
subplot(1,3,3);
imshow(maskedImage);
title('Segmented Color Image');


originalImage = maskedImage;
% Determine it's size and turn it into color if it's not already color.
[rows columns numberOfColorBands] = size(originalImage);
if numberOfColorBands < 3
	% It's not a color image - it's a monochrome image.  Turn it into a color image.
	uiwait(msgbox('Note: this is a monochrome image, not a color image.'));
	originalImage = cat(3, originalImage, originalImage, originalImage);
end
% Display the original color image.
hFigOriginal = figure;
set(hFigOriginal, 'Name', 'originalImage');
imshow(originalImage, []);
fontSize = 18;
title('Original Color Image', 'FontSize', fontSize);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
drawnow;

% Construct the 3D gamut.
lutSize = 256;  % Use 256 to get maximum resolution possible out of a 24 bit RGB image.
lutSize = 8;  % Use a smaller LUT size to get colors grouped into fewer, larger groups in the gamut.
reductionFactor = double(256) / double(lutSize);
gamut3D = zeros(lutSize, lutSize, lutSize);
for row = 1 : rows
	for col = 1: columns
		redValue = floor(double(originalImage(row, col, 1)) / reductionFactor) + 1;	% Convert from 0-255 to 1-256
		greenValue = floor(double(originalImage(row, col, 2)) / reductionFactor) + 1;	% Convert from 0-255 to 1-256
		blueValue = floor(double(originalImage(row, col, 3)) / reductionFactor) + 1;	% Convert from 0-255 to 1-256
		gamut3D(redValue, greenValue, blueValue) = gamut3D(redValue, greenValue, blueValue) + 1;
	end
end

% Now construct the color frequency image.
% Make an image where we get the color of the original image, and have the output value of the color
% frequency image be the number of times that exact color occurred in the original image.
colorFrequencyImage = zeros(rows, columns);
for row = 1 : rows
	for col = 1: columns
		redValue = floor(double(originalImage(row, col, 1)) / reductionFactor) + 1;	% Convert from 0-255 to 1-256
		greenValue = floor(double(originalImage(row, col, 2)) / reductionFactor) + 1;	% Convert from 0-255 to 1-256
		blueValue = floor(double(originalImage(row, col, 3)) / reductionFactor) + 1;	% Convert from 0-255 to 1-256
		freq = gamut3D(redValue, greenValue, blueValue);
		colorFrequencyImage(row, col) =  freq;
	end
end
numberOfColors = double(rows) * double(columns);
disp(numberOfColors);
numberOfColors = sum(sum(sum(gamut3D)));
disp(numberOfColors);
sumr = sum(sum(colorFrequencyImage));
disp(sumr);
figure;
imshow(colorFrequencyImage, []);
normImage = colorFrequencyImage * 255 / max(max(colorFrequencyImage));
% imtool(colorFrequencyImage, [0 25]);
title('Color Frequency Image', 'FontSize', fontSize);
imwrite(normImage, 'Color Frequency Output Image.tif');
% [lowThreshold highThreshold lastThresholdedBand] = threshold(1, 100, colorFrequencyImage);
message = sprintf('Done!\nThe color frequency image represents how often\nthe color of each pixel occurs anywhere in the image.\nIf the pixel is brighter than that color appears more often in the image.');
uiwait(msgbox(message));
