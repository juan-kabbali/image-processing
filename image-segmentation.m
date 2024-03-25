%% plantillas de filtro balanceadas (suma de los terminos = 0)
% Segmentación	es	separar objetos	y distinguirlos	entre sí
%Similitud -> pixeles parecidos a alguna propiedad
%Discontnuidad -> destacan del fondo, bordes
%Conectividad -> pixeles del mismo objeto son contiguos
% se basa en caracteristicas del objeto como nivel de gris, color, bordes  etc

% despues de la segmentacion se tienen regiones
%Ri -> no tocan bordes del objeto en la imagen
%R -> conjunto union de todas las regiones
%Rc -> conjunto complemento de r

%%  Binarizacion coins
%Seleccionar el valor adecuado para binarizar (optimo de disparo) Otsu
% comparacion del valor minimo entre los dos valores maximos

I=imread('coins.png');	
figure(1),	imshow(I);	
figure(2), imhist(I);
level=	graythresh(I)/1.32;	% metodo de otsu
BW=	im2bw(I,level);	
figure(3),	imshow(BW);
figure(4),	subplot(2,1,1), imhist(I);
            subplot(2,1,2), imhist(BW), xlim([-0.1,1.1]);

BW = uint8(BW); 
Ip = I.*BW;
figure(5), imshow(Ip);

%% Biarizacion rice
I=imread('rice.png');	
figure(1),	imshow(I);	
level=	graythresh(I);	
BW=	im2bw(I,level);	
figure(2),	imshow(BW);
figure(3),	subplot(2,1,1), imhist(I);
            subplot(2,1,2), imhist(BW), xlim([-0.1,1.1]);
BW = uint8(BW);
Ip = I.*BW;
figure(4), imshow(Ip);
            
%% Etiquetado -> a cada objeto se le asigna un valor de gris distinto para distinguirlos entre si

I	=	imread('imagenbase.jpg');	

%Binarice	la	imagen,	con	fondo	negro	not(negado)
Ib	=	not(im2bw(I));	

figure,	subplot(2,1,1), imshow(I);
        subplot(2,1,2), imshow(Ib);
        
%Etiquete	la	imagen	
L	=	bwlabel(im2bw(I));
J	=	label2rgb(L);	
figure, imshow(J);	

% L	=	bwlabel(im2bw(I));
% J	=	label2rgb(L,jet);	 numero de objetos en la imagen
% figure, imshow(J);	


%% Etiquetado koala
I	=	imread('Koala.jpg');

%Binarice	la	imagen,	con	fondo	negro	not(negado)
Ib	=	not(im2bw(I));	
figure,	subplot(2,1,1), imshow(I);
        subplot(2,1,2), imshow(Ib);
        
%ELquete	la	imagen	
L	=	bwlabel(Ib);
J	=	label2rgb(L);	
figure, imshow(J);	
% 
% [L,numero] =bwlabel(Ib);	
% J	=label2rgb(L,jet);	
% Imshow(J)

%% Division y union de regiones (Split and merge) representar los objetos con un numero limitado de resoluciones
%split --> divide la imagen en varias partes.
%merge --> unir regiones vecinas que compartan un nivel de gris similar.

I4=rgb2gray(imread('alumgrns.jpg'));
%Normalizamos	los	valores	de	dicha	imagen.	

minimo=double(min(min(I4)));	
maximo=double(max(max(I4)));	
I4=255*(double(I4)-minimo)/(maximo-minimo);
I4=uint8(I4);

%Clasificamos	todos	los	valores	de	gris	en	6	grupos(redondeando,	por	simplicidad)
J=round(I4/(255/5));	


I	=	rgb2gray(imread('alumgrns.jpg'));	
n=6;	
X=grayslice(I,n)	
	
figure,	subplot(2,1,1), imshow(J,[]),colormap(jet), title('a pie');
        subplot(2,1,2), imshow(X,[]),colormap(jet), title('metodo doña grayslice');

      
