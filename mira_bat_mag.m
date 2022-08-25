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

