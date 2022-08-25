close all
clear all
start
nc=netcdf('mag_grd.nc','w');
figure(1)
h=nc{'h'}(:,:);
pcolor(h(430:490,130:190))
colorbar

figure(2)
mask=nc{'mask_rho'}(:,:);
pcolor(mask(430:490,130:190))
colorbar

hnew=h(430:490,130:190);

A=hnew;

w=5;
[Nr,Nc] = size(A);
Nextra  = 0.5*(w-1);
Ap      = interp2(1:Nc,1:Nr,A,-Nextra+1:Nc+Nextra,(-Nextra+1:Nr+Nextra).','makima');    % 2D extrapolation must use 'spline' or 'makima' interpolation
% Smooth data with sliding window
H  = ones(w)./w^2;                      % The 2D averaging filter
B  = filter2(H,Ap,'valid');             % The smooth resulting matrix
% Visualize data
figure(3); pcolor(A); colorbar; shading interp;
figure(4); pcolor(B); colorbar; shading interp;


nc{'h'}(430:490,130:190)=B;
close(nc)
