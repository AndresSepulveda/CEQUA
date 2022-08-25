grdname='mag_grd.nc';
frcname='mag_frc.nc';
clmname='mag_clm.nc';
ininame='mag_ini.nc';
oaname='mag_oa.nc';

coads_time=(15:30:345);
coads_cycle=360;
woa_time=(15:30:345);
woa_cycle=360;

Roa=0;
makeplot=0;
makeclim=1;
makeini=1;
makeoa=1;
makebry=1;
makeZbry=1;
insitu2pot=1;

bryname='mag_bry.nc';
Zbryname='mag_Zbry.nc';

%dl=1/120;
%lonmin=-78.8;
%lonmax=-64;
%latmin=-56.3;
%latmax=-50.698;

theta_s=7;
theta_b=2;
hc=20;
hmin=20;
N=42;
tini=0;
vtransform =2;

obc=[1 1 1 1];
zref=-1000;

coads_dir='/data2/matlab/CROCOv1p2p1/croco_tools/COADS05/';
climato_dir='/data2/matlab/CROCOv1p2p1/croco_tools/WOA2009/';

CROCO_title='Magallanes';
