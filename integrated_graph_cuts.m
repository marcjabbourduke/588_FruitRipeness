clc
clear all
close all
warning off
a = true;
while(a)
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

for i=1:length(allImages)
    im = evalin('base', string(allImages(i)));
    figure;
    subplot(1,2,1);
    imshow(im);
    subplot(1,2,2);
    % A = getRGB(im)
    % imshow(A)
end


