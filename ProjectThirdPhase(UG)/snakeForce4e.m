function [Fx,Fy] = snakeForce4e(emap)
% Group Members: Mohamed Rahaman, Eric Nwokocha
% CSCE-4240 Digital Image Processing
%
%function [Fx,Fy] = snakeForce4e(emap,mode,mu,niter)
% [Fx,Fy] = SNAKEFORCE4E(EMAP,MODE,MU,NITER) uses input edge
% map, EMAP, to derive force images Fx and Fy. These images are of
% the same size as EMAP and contain the x and y force components
% at ALL points of EMAP. For example, given coordinates (i,j) of
% EMAP, Fx(i) is the x-component and Fy(j) is the y-component.
% If MODE = 'gradient',
% (the default) force components Fx and Fy of the gradient of
% EMAP is computed (remember, the gradient is a 2-D vector). This
% mode does not require MU or NITER. If MODE = 'gvf' then the
% force is based on the gradient vector flow of the edge map [see
% Eqs. (11-55) and (11-56)]. Option 'gvf' requires that MU and the
% number of iterations, NITER, be provided.
 
[Fx,Fy] = gradient(emap); 

end 
