function main
% Group Members: Mohamed Rahaman, Eric Nwokocha
% CSCE-4240 Digital Image Processing

f = 'U200.tif'; % the image to be processed

% Get and save emap
EMAP = snakeMap4e(f); 
figure('Name', 'MOG of Image'), imshow(EMAP, []), title('MOG of Image');
saveas(gcf, fullfile(pwd,'U200_mog'),'jpg');

% Get and save quiver of emap
[DX,DY] = snakeForce4e(EMAP); 
DX = flipud(DX); 
DY = flipud(DY);
figure('Name', 'Image Gradient'), quiver(DX, DY), title('Force Map of Image');
saveas(gcf, fullfile(pwd,'U200_quiver'),'jpg');

end

