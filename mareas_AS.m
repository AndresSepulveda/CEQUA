clear all
close all

dir= '/home/valentina/Escritorio/Tesis1/Mareas/';

%Reading NCEP2 files
file1 = [dir 'mosa_BGQ_BGuafo.nc'];
file2 = [dir 'mosa_BGQ_grd_BGuafo.nc'];

ncdisp(file1);
ncdisp(file2);

%Cargar las variables
u=ncread([file1],'u');
h=ncread([file2],'h');
h=h';
u=squeeze(u(1,:,:,:));


s_rho=ncread([file1],'s_rho');

z=[];
for i=1:33
    z(i,:)=h(i)*s_rho;
end

eta_rho=ncread([file1],'eta_rho');

%%% x = haversine(eta_rho,eta_rho(0));

% 
% https://gitlab.inria.fr/croco-ocean/croco_tools/-/blob/master/Visualization_tools/vertslice.m
%

%Grafico de prueba de la seccion U


figure()
pcolor(eta_rho,s_rho,u(:,:,1)')
shading interp


%Matriz

%idx=find(A==0);

%A(idx)=NaN;

%(find(A==0)=NaN)=B;

%A=u(:,:,1);

%Puntos de la componente de la velocidad U, filas=tiempo, Columna=profundidades, Tercera=Latitud 

aM2=[];
aS2=[];
a01=[];
res=[];
meteo=[];

for i=1:33
    for k=1:42
       aux=squeeze(u(i,k,:));

	% En NAME se guarda el nombre del armonico
	% En FREQ se guarda la frecuencia
	% En TIDECON se guarda la amplitud y fase con sus respectivos errores
	% En XOUT se guarda la serie temporal de marea astronomica

	% En t_tides especificamos: (1) Los datos del nivel del mar 
	%                           (2) 'output' especificamos que es una salida
	%                           (3) nombre del fichero de salida


	%Funcion guardada como estructura
	[tidestruc,XOUT]=t_tide(aux,'output','none');
	%Funcion con todas las variables

	[NAME,FREQ,TIDECON,XOUT]=t_tide(aux);

	aux2=ismember(NAME,'K1  ','rows');
	indxK1=find(aux2==1);
	aux2=ismember(NAME,'O1  ','rows');
	indxO1=find(aux2==1);
	aux2=ismember(NAME,'M2  ','rows');
	indxM2=find(aux2==1);
	aux2=ismember(NAME,'S2  ','rows');
	indxS2=find(aux2==1);

	aux_aK1=TIDECON(indxK1,1);
	aux_aO1=TIDECON(indxO1,1);
	aux_aM2=TIDECON(indxM2,1);
	aux_aS2=TIDECON(indxS2,1);

	aM2(i,j)= aux_M2 ;
	a01(i,j)= aux_01 ;

%%	res(i,j)= ;
%%	u(t) = res + aM2*sen(wM2*t+pM2) + aO1*sen(wO1*t+pO1)

	meteo(i,j,:) = aux-XOUT;

    end   
end
 



