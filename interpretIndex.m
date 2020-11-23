function [text, benchmark, hexcode] = interpretIndex(fruitType,ripenessIndex)
%INTERPRETINDEX Summary of this function goes here
%   Detailed explanation goes here
benchmark = '';
    switch fruitType
        case 'Banana'
              benchmark = "Value Guidelines" + newline ...
                          + newline + "Underripe: index < -5"...
                          + newline + "Barely ripe: -5 < index < 5"...
                          + newline + "Ripe: 5 < index < 100"...
                          + newline + "Overripe: index > 100";
              if ripenessIndex < -5
                  text = 'This banana is not ripe yet.';
                  hexcode = '#fabab6';
              else
                  if ripenessIndex < 5
                      text = 'This banana is ripe.';
                      hexcode = '#bef7d0';
                  else
                      text = 'This banana is too ripe; be careful!';
                      hexcode = '#f7f7be';
                  end
              end
        case 'Orange'
              benchmark = "Value Guidelines" + newline ...
                          + newline + "Underripe: index < -50"...
                          + newline + "Barely ripe: -50 < index < -10"...
                          + newline + "Ripe: -10 < index < 12"...
                          + newline + "Bad: index > 12";
              if ripenessIndex < -50
                  text = 'This orange is not ripe yet';
                  hexcode = '#fabab6';
              else
                  if ripenessIndex < -10
                      text = 'This orange is barely ripe; be careful!';
                      hexcode = '#f7f7be';
                  if ripenessIndex >= -10 && ripenessIndex < 12
                      text = 'This orange is ripe.';
                      hexcode = '#bef7d0';
                  end
              else
                      text = 'This orange is bad; be careful!';
                      hexcode = 'fabab6';
                  end
              end
        case 'Strawberry'
              benchmark = "Value Guidelines" + newline ...
                          + newline + "Fresh: index < 2.0" ...
                          + newline + "Check for mold: 2.0 < index < 6.0" ...
                          + newline + "Mold: index > 6.0";
              if ripenessIndex < 2
                  text = 'This strawberry is fresh.';
                  hexcode = '#bef7d0';
              else
                  if ripenessIndex < 6
                      text = 'Check this straberry for mold.';
                      hexcode = '#f7f7be';
              else
                      text = 'This strawberry is moldy.';
                      hexcode = '#fabab6';
                  end
              end
    end



end

