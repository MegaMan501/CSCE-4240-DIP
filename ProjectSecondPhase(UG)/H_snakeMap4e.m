function H_snakeMap4e
% Group Members: Mohamed Rahaman, Eric Nwokocha
% CSCE-4240 Digital Image Processing
% Feb 15, 2019
%
% The three types of invocations:  
% Emap = snakeMap4e (f, t, sig, nsig, order)
% Emap = snakeMap4e (f, 'auto')
% Emap = snakeMap4e (f)  

    f='rose512.tif';    % set the image to be processed
    
    % Emap is produced without thresholding and without blurring
    EMAP = snakeMap4e(f);   
    figure('visible','off'), imshow(EMAP, []);
    saveas(gcf, fullfile(pwd,'rose512_a'),'tif');
    %imwrite(EMAP, 'rose512_1.tif'); %Save the EMAP of image
    
    % Emap is produced from a threshold automatically computed and no blurring is done
    EMAP = snakeMap4e(f,'auto');
    imwrite(EMAP, 'rose512_f.tif'); %Save the EMAP of image
    
    % Emap is produced from a given threshold, given Gaussian filter parameters, and no blurring is performed 
    EMAP = snakeMap4e(f,0.3,0.8,7,'none');
    imwrite(EMAP, 'rose512_e.tif'); %Save the EMAP of image
    
    % Emap is produced from a given threshold, given Gaussian filter parameters, and blurring is
    % performed both on the image before Emap is computed and to the MOG after Emap is
    % computed.
    EMAP = snakeMap4e(f,0.4,0.5,5,'both');
    imwrite(EMAP, 'rose512_d.tif'); %Save the EMAP of image
    
    % Emap is produced from a given threshold, given Gaussian filter parameters, and the edge map is
    % blurred after MOG is computed    
    EMAP = snakeMap4e(f,0.2,0.7,7,'after');
    imwrite(EMAP, 'rose512_c.tif'); %Save the EMAP of image
    
    % Emap is produced from a given threshold, given Gaussian filter parameters, and the image is
    % blurred before producing Emap
    EMAP = snakeMap4e(f,0.3,0.8,7,'before');
    imwrite(EMAP, 'rose512_b.tif');%Save the EMAP of image
    
    disp('Done'); 
end