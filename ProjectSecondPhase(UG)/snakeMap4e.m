function EMAP = snakeMap4e(f, varargin)
% Group Members: Mohamed Rahaman, Eric Nwokocha
% CSCE-4240 Digital Image Processing
% Feb 15, 2019
%
%   EMAP = SNAKEMAP4E(F,T,SIG,NSIG,ORDER) computes the edge map,
%   EMAP, of input image F. If only F is provided in the input, EMAP
%   will equal the magnitude of the gradient (MOG) of F without
%   thresholding. If T is also provided, EMAP is thresholded so
%   that, at any point, EMAP = 1 if EMAP > T, and it is zero
%   otherwise. If T is the string 'auto', thresholding is done
%   automatically. Otherwise, T is expected to be a number in the
%   range [0,1]. If the IP Toolbox is installed, the auto
%   thresholdoing is done by function edge. If not, the auto
%   thresholding is done by project function outsuThresh4e. No
%   smoothing filter is applied. If all inputs are provided, the MOG
%   is thresholded and filtered using a Gaussian kernel of size
%   NSIG*SIG-by-NSIG*SIG and standard deviation SIG. ORDER is a
%   character string with the following possible values: If order =
%   'before' then image F is filtered before the map (MOG) is
%   computed. If order = 'after' filtering is performed on the edge
%   map after it is computed. If If ORDER = 'both' filtering is
%   performed before and after the edge map is computed. If ORDER =
%   'none', no filtering is performed. This is the default.
%   Gradients are computed using the Sobel kernels.
    
    I = imread(f); % read in the input image
    
    if nargin > 5         
        error('Error too many arguements!'); 
    
    elseif nargin == 2      
        t=varargin{1}; % set the threshold
        thresF=0.5;    % set the threshold factor
        
        % Check for auto keyword
        if ischar(t) && t == "auto" 
            [~, t] = edge(I, 'sobel');
        end
        
        % Validate the threshold 
        if ( t < 0 || t > 1 ) && ischar(t) == 0
            error('Threshold out of bounds'); 
        end
        
        EMAP = edge(I,'sobel', t * thresF);     % set the edge map
        %figure, imshow(EMAP);
   
    elseif nargin == 3 || nargin == 4
        error('Wrong function signnature'); 
    elseif nargin == 5
        t=varargin{1};  % set the threshold
        thresF=0.1;     % set the threshold factor
        sig=varargin{2}; % set the sigma value
        nsig=varargin{3}; % set the n*sigma value
        order=varargin{4}; % set the order type
        
        % Check for auto keyword
        if ischar(t) && t == "auto" 
            [~, t] = edge(I, 'sobel');
        end 
        
        % Validate the threshold 
        if ( t < 0 || t > 1 ) && ischar(t) == 0
            error('Threshold out of bounds'); 
        end
        
        % Blur Logic (before, after, both, or none)
        if order == "before" 
            H = fspecial('gaussian', [floor(nsig*sig) floor(nsig*sig)], sig);  
            I = imfilter(I, H, 'same'); 
            Gmag = imgradient(I, 'sobel'); 
            EMAP = edge(I, 'sobel',t * thresF); 
            
        elseif order == "after" 
            H = fspecial('gaussian', [floor(nsig*sig) floor(nsig*sig)], sig);
            Gmag = imgradient(I, 'sobel'); 
            EMAP = edge(I, 'sobel',t * thresF);  
            I = imfilter(I, H, 'same'); 
            
        elseif order == "both"
            H = fspecial('gaussian', [floor(nsig*sig) floor(nsig*sig)], sig);
            I = imfilter(I, H, 'same'); 
            Gmag = imgradient(I, 'sobel'); 
            EMAP = edge(I, 'sobel',t * thresF);
            I = imfilter(I, H, 'same'); 
            
        elseif order == "none"
            Gmag = imgradient(I, 'sobel'); 
            EMAP = edge(I, 'sobel',t * thresF);  
             
        end
        
        EMAP = imfuse(imfuse(EMAP,Gmag,'diff'), I, 'diff'); % combine the three images
        %figure, imshow(EMAP);
        
    elseif nargin == 1
        Gmag = imgradient(I, 'sobel'); 
        EMAP = Gmag; 
        %figure, imshow(EMAP, []);
    else 
        error('Error not enough arguements!'); 
    end     
end
