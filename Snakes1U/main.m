function main(f)
% Group Members: Mohamed Rahaman, Eric Nwokocha
% CSCE-4240 Digital Image Processing
% January 31, 2019
%
    % Validate input
    p = 'Enter file name: ';
    while (exist(f, 'file') == 0)
        f= input(p, 's');
    end

    % Get User input for the number of segments
    np = input('Enter the number of segments: ');
    while ( np > 25 ) || ( np < 10)
        disp('Enter a number between 10 and 25')
        np = input('Enter the number of segments: ');
    end

    % The three calls to the snake_manual_input
    snake_manual_input(f, np, '-rs', 'redSquareContour');
    snake_manual_input(f, np, '-yo', 'yellowCircleContour');
    snake_manual_input(f, np, '-bd', 'blueDiamondContour');

end
