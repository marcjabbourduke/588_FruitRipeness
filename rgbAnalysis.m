
function ripenessIndex = rgbAnalysis(image, fruitType)
    I = evalin('base', string(image));

    % ************************** ************************** 
    % Add RGB Limits for different colors here

    %brown
    b_redLowerLimit = 5; 
    b_redUpperLimit = 153; 
    b_blueLowerLimit = 0; 
    b_blueUpperLimit = 60; 
    b_greenLowerLimit = 0; 
    b_greenUpperLimit = 76; 

    %yellow
    y_redLowerLimit = 153; 
    y_redUpperLimit = 255; 
    y_blueLowerLimit = 0; 
    y_blueUpperLimit = 204; 
    y_greenLowerLimit = 153; 
    y_greenUpperLimit = 255; 
    
    % ************************** ************************** 
    % Add similar code to below for different colors

    % Percentage of yellow in the image
    y_requiredColor  = ( I(:,:,1) >= y_redLowerLimit & I(:,:,1) <= y_redUpperLimit ) & ...
        ( I(:,:,2) >= y_greenLowerLimit & I(:,:,2) <= y_greenUpperLimit ) & ( I(:,:,3) >= y_blueLowerLimit & I(:,:,3) <= y_blueUpperLimit ); 
    y_percentColor =  100*(sum(sum(y_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(y_percentColor == 0)
        y_percentColor = 0.01;
    end
    disp('Y');
    disp(y_percentColor);

    % Percentage of brown in the image
    b_requiredColor  = ( I(:,:,1) >= b_redLowerLimit & I(:,:,1) <= b_redUpperLimit ) & ...
        ( I(:,:,2) >= b_greenLowerLimit & I(:,:,2) <= b_greenUpperLimit ) & ( I(:,:,3) >= b_blueLowerLimit & I(:,:,3) <= b_blueUpperLimit ); 
    b_percentColor =  100*(sum(sum(b_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(b_percentColor == 0)
        b_percentColor = 0.01;
    end
    disp('B');
    disp(b_percentColor);

    % ************************** ************************** 
    % Add Cases for different fruits
    if(fruitType == 'Banana')
        ripenessIndex = b_percentColor * 100 / y_percentColor;
    end
  

end