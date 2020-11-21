clc
clear all
close all
warning off
a = true;
while(a)
    
    % ************************** ************************** 
    % Add fruit options here
    
     fruitType = questdlg('What fruit would you like to process?', ...
	'Fruit Type', ...
	'Banana','Orange','Strawberry','Strawberry');
     waitfor(fruitType);

    
    [filename,user_canceled] = imgetfile;
    I = imread(filename);
    imageSegmenter(I);

    mydlg = warndlg('Press here when done segmenting image', 'Finish');
    waitfor(mydlg);
    imageSegmenter close;

    answer = questdlg('Would you like to keep segmenting images?', ...
	'Finish', ...
	'Yes','No','No');

    switch answer
        case 'Yes'
            continue;
        case 'No'
            a = false;
            break;
    end
end

% start every masked image with 'mask_'
allImages = who('-regexp', '^mask');

for i=1:length(allImages)
    im = evalin('base', string(allImages(i)));
    figure;
    subplot(1,2,1);
    imshow(im);
    subplot(1,2,2);
    disp(fruitType);
    index = rgbAnalysis(allImages(i), fruitType);
    text(0.5,0.5,string(index)); axis off
    disp(index);
end


