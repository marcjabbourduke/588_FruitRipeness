
function ripenessIndex = rgbAnalysis(image, fruitType)
    I = evalin('base', string(image));

    % ************************** ************************** 
    % Add RGB Limits for different colors here
    
    %banana
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
    
    %strawberry
    %red
    r_redLowerLimit = 100; %100
    r_redUpperLimit = 255; 
    r_blueLowerLimit = 30; %30
    r_blueUpperLimit = 100; 
    r_greenLowerLimit = 30; %30
    r_greenUpperLimit = 100; 
    
    %whire
    w_redLowerLimit = 200; 
    w_redUpperLimit = 255; 
    w_blueLowerLimit = 200; 
    w_blueUpperLimit = 255; 
    w_greenLowerLimit = 200; 
    w_greenUpperLimit = 255; 
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
    %disp('Y');
    %disp(y_percentColor);

    % Percentage of brown in the image
    b_requiredColor  = ( I(:,:,1) >= b_redLowerLimit & I(:,:,1) <= b_redUpperLimit ) & ...
        ( I(:,:,2) >= b_greenLowerLimit & I(:,:,2) <= b_greenUpperLimit ) & ( I(:,:,3) >= b_blueLowerLimit & I(:,:,3) <= b_blueUpperLimit ); 
    b_percentColor =  100*(sum(sum(b_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(b_percentColor == 0)
        b_percentColor = 0.01;
    end
    %disp('B');
    %disp(b_percentColor);
    
        % Percentage of yellow in the image
    r_requiredColor  = ( I(:,:,1) >= r_redLowerLimit & I(:,:,1) <= r_redUpperLimit ) & ...
        ( I(:,:,2) >= r_greenLowerLimit & I(:,:,2) <= r_greenUpperLimit ) & ( I(:,:,3) >= r_blueLowerLimit & I(:,:,3) <= r_blueUpperLimit ); 
    r_percentColor =  100*(sum(sum(r_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(r_percentColor == 0)
        r_percentColor = 0.01;
    end
    disp('R');
    disp(r_percentColor);

    % Percentage of brown in the image
    w_requiredColor  = ( I(:,:,1) >= w_redLowerLimit & I(:,:,1) <= w_redUpperLimit ) & ...
        ( I(:,:,2) >= w_greenLowerLimit & I(:,:,2) <= w_greenUpperLimit ) & ( I(:,:,3) >= w_blueLowerLimit & I(:,:,3) <= w_blueUpperLimit ); 
    w_percentColor =  100*(sum(sum(w_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(w_percentColor == 0)
        w_percentColor = 0.01;
    end
    disp('W');
    disp(w_percentColor);

    % ************************** ************************** 
    % Add Cases for different fruits
    switch fruitType 
        case 'Banana'
            ripenessIndex = b_percentColor * 100 / y_percentColor;
    
        case 'Strawberry'
            ripenessIndex = w_percentColor * 100 / r_percentColor;
    end
  

end