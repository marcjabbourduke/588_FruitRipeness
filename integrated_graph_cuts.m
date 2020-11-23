clc
clear all
close all
warning off
a = true;
benchmark = '';
while(a)
    
    % ************************** ************************** 
    
     helpInfo = ['Welcome to the fruit ripeness indicator. To use this application:' ...
         newline newline...
         '1. Select the type of fruit you wish to analyze.' ...
         newline...
         '2. Select the image(s) you wish to use. ' ...
         newline...
         'When the application is launched via opening the image(s), '...
         'for every image:' ...
         newline...
         '3. Select the Graph Cut option in the Image Segmenter window.' ...
         newline...
         '4. Mark the foreground and background of the image so that the '...
         'fruit to analyze is the foreground.' ...
         newline...
         '5. Press Create Mask and then Export.' ... 
         newline...
         '6. Deselect the Final Segmentation option and export ' ...
         'the mask to workspace with a unique name beginning with the prefix "mask."' ...
         newline...
         '7. When done creating masks of the image(s), press "OK" in the ' ...
         'Finish messag box to proceed to color anlysis and output.' ...
          newline newline...
         'What fruit would you like to process?'];
     fruitType = questdlg(helpInfo, ...
	'Fruit Ripeness Indicator', ...
	'Banana','Orange','Strawberry','Strawberry'); % Add fruit options here
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
    [message, benchmark, hexcode] = interpretIndex(fruitType, index);
    s = text(0.1,0.8,"Ripeness Index:  " + string(index)); axis off
    s.FontSize = 12;
    s.FontWeight = 'bold';
    disp(index);
    t = text(0.1,0.1,3,string(benchmark)); axis off
    t.FontSize = 12;
    t.FontAngle = 'italic';
    u = text(0.1,.5,3,message); axis off
    u.FontSize = 14;
    u.FontWeight = 'bold';
    disp(hexcode);
    u.BackgroundColor = hexcode;
    u.LineStyle = '--';
    u.Margin = 20;
    disp(benchmark);
        
end


