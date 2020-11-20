
function ripenessIndex = rgbAnalysis(image)
    % Read image
    %I = imread('/Users/marcjabbour/Desktop/b3.png'); 
    I = evalin('base', string(image));

    % Define RGB limits

    %brown
    b_redLowerLimit = 5; 
    b_redUpperLimit = 153; 
    b_blueLowerLimit = 0; 
    b_blueUpperLimit = 0; 
    b_greenLowerLimit = 0; 
    b_greenUpperLimit = 76; 

    %yellow
    y_redLowerLimit = 153; 
    y_redUpperLimit = 255; 
    y_blueLowerLimit = 0; 
    y_blueUpperLimit = 204; 
    y_greenLowerLimit = 153; 
    y_greenUpperLimit = 255; 

    % Number of pixels of required colour
    y_requiredColor  = ( I(:,:,1) >= y_redLowerLimit & I(:,:,1) <= y_redUpperLimit ) & ...
        ( I(:,:,2) >= y_greenLowerLimit & I(:,:,2) <= y_greenUpperLimit ) & ( I(:,:,3) >= y_blueLowerLimit & I(:,:,3) <= y_blueUpperLimit ); 
    % Percentage of colour in the image
    y_percentColor =  100*(sum(sum(y_requiredColor))/(size(I,1)*size(I,2))); 
    disp('Y');
    disp(y_percentColor);

    b_requiredColor  = ( I(:,:,1) >= b_redLowerLimit & I(:,:,1) <= b_redUpperLimit ) & ...
        ( I(:,:,2) >= b_greenLowerLimit & I(:,:,2) <= b_greenUpperLimit ) & ( I(:,:,3) >= b_blueLowerLimit & I(:,:,3) <= b_blueUpperLimit ); 
    % Percentage of colour in the image
    b_percentColor =  100*(sum(sum(b_requiredColor))/(size(I,1)*size(I,2))); 
    disp(b_percentColor);

    %disp(b_percentColor * 100 / y_percentColor);

    %ripenessIndex = b_percentColor * 100 / y_percentColor;
    ripenessIndex = 100 / y_percentColor;

end