%% Filtro pasa bajos - Promedio
I	=	imread('coins.png');	
h	=	ones(3,3)/9;	
I2	=	imfilter(I,h);	
imshow(I),title('Imagen Original');	
figure,	imshow(I2),	title('Imagen Filtrada')	
figure,	freqz2(h),	title('Respuesta	en	frecuencia')

%% Replicate
%compensa los bordes, replicando los valores por fuera de la imagen en donde son 0

I3	=	imfilter(I,h,'replicate');	
figure,	imshow(I3);		
title('Imagen	con	bordes replicados')

%% Filtrado para una imagen png

I	=	imread('peppers.png');	
imshow(I);	
h	=	ones(5,5)/25;	
J	=	imfilter(I,h);	
figure,	imshow(J)	
figure,	freqz2(h),	title('Respuesta	en	frecuencia')

%% sal y pimienta
I	=	imread('eight.tif');	
J	=	imnoise(I,'salt & pepper',0.01);	
figure,	imshow(I)	
figure,	imshow(J)	

%% Speckle
I	=	imread('eight.tif');	
J	=	imnoise(I,'speckle');	
figure,	imshow(I)	
figure,	imshow(J)	

%% poisson
I	=	imread('eight.tif');	
J	=	imnoise(I,'poisson');	
figure,	imshow(I)	
figure,	imshow(J)	

%% gaussiano

I	=	imread('eight.tif');	
J	=	imnoise(I,'gaussian');	
figure,	imshow(I)	
figure,	imshow(J)	


%% Realzar detalles Filtro unsharp - pasa altos

I	=	imread('moon.tif');	
h	=	fspecial('unsharp');	
I2	=	imfilter(I,h);	
imshow(I),	title('Imagen	original')	
figure,	imshow(I2),	title('Imagen	filtrada')	
figure,	freqz2(h),	title('Respuesta	en	frecuencia')

%%
% t tamaño del filtro
% gausiano- filtro pasa bajos (suaviza bordes)

t=3;	
sigma=0.5;	
I	=	imread('cameraman.tif');	
h	=	fspecial('gaussian' ,t,sigma);	
J	=	imfilter(I,h,'replicate');	
imshow(J);	
title('Imagen	filtrada');	
figure,	freqz2(h),	title('Respuesta	en	frecuencia')
imshow(I)

%% Pasa bajos mascara de 3*3 

I	=	imread('cameraman.tif');	
h	=	( 1/9 )* ones(3,3);
J	=	imfilter(I,h,'replicate');	
imshow(J);	
title('Imagen	filtrada');	
figure,	freqz2(h),	title('Respuesta	en	frecuencia')
imshow(I)

%% Filtro laplaciano basado en derivadas pasa alto detecta Bordes

alpha=0.2;	
I	=	imread('cameraman.tif');	
h	=	fspecial('laplacian',alpha);	
J	=	imfilter(I,h,'replicate');	
imshow(J);	title('Imagen	filtrada');	
figure,	freqz2(h),	title('Respuesta	en	frecuencia')

%%  laplaciano de la gausiana  (suaviza bordes)
t=3;	
sigma=0.5;	
I	=	imread('cameraman.tif');	
h	=	fspecial('log',t,sigma);	
J	=	imfilter(I,h,'replicate');	
imshow(J);
title('Imagen	filtrada');	
figure,	freqz2(h),	title('Respuesta	en	frecuencia')

%%  Detector de bordes de roberts  (Basado en gradiente)
 
I=imread('rice.png');	
J1=edge(I,'roberts',0.1);	figure,	imshow(J1)	
J2=edge(I,'roberts',0.05);	figure,	imshow(J2)


%% Bordes   'horizontal' 'vertical' 'diagonal' prewitt (Basado en gradiente)

I=imread('rice.png');	
 J=edge(I,'prewitt',0.05,'both');	
imshow(J)

%% Sobel:	Da	mayor	importancia	a	los	píxeles	centrales  (Detector de bordes)  (Basado en gradiente)

I=imread('rice.png');	
J=edge(I,'sobel');
imshow(J)

%% Detector de bordes Marr-Hildreth (Pasa banda) 
%Cuanto más	estrecha la	gausiana más bordes	se	obtendrán(menor	sigma),	en	ocasiones	muchos más	de	los	necesarios	(plato	de	espagueE).	

I=imread('rice.png');	
figure,	imshow(I);	
J=edge(I,	'log');		
%J=edge(I,	'log',thresh,sigma);	
figure,	imshow(J);


%% Detector de bordes Canny optimización	del	producto	señal-ruido,	

I=imread('rice.png');	
J=edge(I,'canny');	
%J=edge(I,'canny',tresh,sigma);
imshow(J)



%% detector de bordes Log
thresh = 0.5;
I=imread('rice.png');	
%J=edge(I,	'log');		
J=edge(I,'log',thresh ,sigma);	
figure,	imshow(J);

%% detctor de lineas

%eo =	[-1	-1 -1; 2 2 2;-1	-1 -1];
%ns=	[-1 2 -1; -1 2 -1;-1 2 -1 ];
%ne-so= [-1 -1 2; -1 2 -1; 2 -1 -1];
%no-se= [2 -1 -1; -1 2 -1; -1 -1 2];

I	=	imread('cameraman.tif');	
eo	=	[-1	-1 -1; 2 2 2;-1	-1 -1];
J=conv2(I,eo);	
maximo	=	max(max(J));	
minimo	=	min(min(J));	
Jn=(J-minimo)/(maximo-minimo);	
figure,	imshow(im2bw(Jn,0.6));


 

























 


