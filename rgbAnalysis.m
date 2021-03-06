
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
    
    %green
    g_redLowerLimit = 0;
    g_redUpperLimit = 153;
    g_blueLowerLimit = 0;
    g_blueUpperLimit = 70;
    g_greenLowerLimit = 190;
    g_greenUpperLimit = 266;
    
    %strawberry
    %red
    r_redLowerLimit = 100; %100
    r_redUpperLimit = 255; 
    r_blueLowerLimit = 30; %30
    r_blueUpperLimit = 100; 
    r_greenLowerLimit = 30; %30
    r_greenUpperLimit = 100; 
    
    %white
    w_redLowerLimit = 200; 
    w_redUpperLimit = 255; 
    w_blueLowerLimit = 200; 
    w_blueUpperLimit = 255; 
    w_greenLowerLimit = 200; 
    w_greenUpperLimit = 255; 
    
    %Orange
    %orange
    o_redLowerLimit = 235; %100
    o_redUpperLimit = 255; 
    o_blueLowerLimit = 0; %30
    o_blueUpperLimit = 115; 
    o_greenLowerLimit = 130; %30
    o_greenUpperLimit = 190; 
    
    %Brown / orangeish
    br_redLowerLimit = 0; 
    br_redUpperLimit = 235; 
    br_blueLowerLimit = 140; 
    br_blueUpperLimit = 225; 
    br_greenLowerLimit = 0; 
    br_greenUpperLimit = 125; 
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
    
    % Percentage of green in the image
    g_requiredColor  = ( I(:,:,1) >= g_redLowerLimit & I(:,:,1) <= g_redUpperLimit ) & ...
        ( I(:,:,2) >= g_greenLowerLimit & I(:,:,2) <= g_greenUpperLimit ) & ( I(:,:,3) >= g_blueLowerLimit & I(:,:,3) <= g_blueUpperLimit ); 
    g_percentColor =  100*(sum(sum(g_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(g_percentColor == 0)
        g_percentColor = 0.01;
    end
    %disp('B');
    %disp(b_percentColor);
    
    % Percentage of red in the image
    r_requiredColor  = ( I(:,:,1) >= r_redLowerLimit & I(:,:,1) <= r_redUpperLimit ) & ...
        ( I(:,:,2) >= r_greenLowerLimit & I(:,:,2) <= r_greenUpperLimit ) & ( I(:,:,3) >= r_blueLowerLimit & I(:,:,3) <= r_blueUpperLimit ); 
    r_percentColor =  100*(sum(sum(r_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(r_percentColor == 0)
        r_percentColor = 0.01;
    end
    %disp('R');
    %disp(r_percentColor);

    % Percentage of white in the image
    w_requiredColor  = ( I(:,:,1) >= w_redLowerLimit & I(:,:,1) <= w_redUpperLimit ) & ...
        ( I(:,:,2) >= w_greenLowerLimit & I(:,:,2) <= w_greenUpperLimit ) & ( I(:,:,3) >= w_blueLowerLimit & I(:,:,3) <= w_blueUpperLimit ); 
    w_percentColor =  100*(sum(sum(w_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(w_percentColor == 0)
        w_percentColor = 0.01;
    end
    %disp('W');
    %disp(w_percentColor);
    
    % Percentage of orange in the image
    o_requiredColor  = ( I(:,:,1) >= o_redLowerLimit & I(:,:,1) <= o_redUpperLimit ) & ...
        ( I(:,:,2) >= o_greenLowerLimit & I(:,:,2) <= o_greenUpperLimit ) & ( I(:,:,3) >= o_blueLowerLimit & I(:,:,3) <= o_blueUpperLimit ); 
    o_percentColor =  100*(sum(sum(o_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(o_percentColor == 0)
        o_percentColor = 0.01;
    end
    disp('O');
    disp(y_percentColor);

    % Percentage of brown-orange (needs closer range)
    br_requiredColor  = ( I(:,:,1) >= br_redLowerLimit & I(:,:,1) <= br_redUpperLimit ) & ...
        ( I(:,:,2) >= br_greenLowerLimit & I(:,:,2) <= br_greenUpperLimit ) & ( I(:,:,3) >= br_blueLowerLimit & I(:,:,3) <= br_blueUpperLimit ); 
    br_percentColor =  100*(sum(sum(br_requiredColor))/(size(I,1)*size(I,2))); 
    % If statement so that we don't get errors for dividing by 0
    if(br_percentColor == 0)
        br_percentColor = 0.01;
    end
    disp('BR');
    disp(br_percentColor);
    

    % ************************** ************************** 
    % Add Cases for different fruits
    switch fruitType 
        case 'Banana'
            ripenessIndex = (b_percentColor * 100 / y_percentColor) - (g_percentColor * 100 / y_percentColor);
    
        case 'Strawberry'
            ripenessIndex = w_percentColor * 100 / r_percentColor;
        
        case 'Orange'
            ripenessIndex = br_percentColor * 100 / o_percentColor - (g_percentColor * 100 / o_percentColor);
    end
  

end