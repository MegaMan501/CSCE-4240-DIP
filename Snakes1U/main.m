function main(f)

p = 'Enter file name: '; 
while (exist(f, 'file') == 0)
    f= input(p, 's'); 
end

np = input('Enter the number of segments: '); 
while ( np > 25 ) || ( np < 10)
    disp('Enter a number between 10 and 25')
    np = input('Enter the number of segments: '); 
end

snake_manual_input(f, np, '-rs', 'redSquareContour');
snake_manual_input(f, np, '-yo', 'yellowCircleContour');
snake_manual_input(f, np, '-bd', 'blueDiamondContour');

end