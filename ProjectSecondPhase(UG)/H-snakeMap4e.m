function H-snakeMap4e
%function emap = snakeMap4e(f,varargin)
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

    
end