%% analizar elementos de forma individual, resolviendo problemas provenientes de la segmentacion
% modifican la estructura de un objeto

%% EROCION
%Definir	un	elemento	estructural.	
se=strel('disk',2);	% Erocionando circulos de radio 2 Area definida (Plantilla de la convolucion)
%se = strel(‘diamond’,tamaño); matriz
%se = strel(‘square’,tamaño); 
%se = strel(‘line’,10,45);
%se = (‘arbitrary’,matriz_deseada);	

I=imread('circles.png');	
J=I;

for	i=1:7	
J=imerode(J,se);	
imshow(J);	
pause;	
end

%% DILATACION

%Definir	un	elemento	estructural.	
se=strel('disk',2);	
I=imread('circles.png');	
J=I;	
for	i=1:7	
J=imdilate(J,se);	
imshow(J);	
pause;	
end

%% CONTEO DE ELEMENTOS

I=imread('rice.png');	
fondo	=	imopen(I,strel('disk',15));	% primero erocion y luego dilatacion con el mismo patron
figure, 
subplot(2,1,1), imshow(fondo), title('dilatada y erosionada');
subplot(2,1,2), imshow(I), title('Original');

J=imsubtract(I,fondo); % resta el fondo de la imagen.
figure, imshow(J), title('sin fondo')

% separado de elementos en una imagen binaria
level=	graythresh(J)/1.32;	
BW=	im2bw(J,level);
BW= imerode(BW,strel('disk',2));
figure, imshow(BW), title('binaria')



%% APERTURA

I	=	imread('pillsetc.png');	
bw	=	~im2bw(I);	
se	=	strel('disk',5);	
bw2	=	imopen(bw,se); 
figure,	imshow(I)	
figure,	imshow(bw),	title('Imagen	Binaria')	
figure,	imshow(bw2),	title('Apertura')	

%% Visualizar claramente las diferencias entre las	imágenes.
[h,w]	=	size(bw);	
J	=	zeros(h,w,3);	
J(:,:,1)=bw;	
J(:,:,2)=bw2;	
imshow(J)	

%% CIERRE

I	=	imread('pillsetc.png');	
bw	=	im2bw(I);	
se	=	strel('disk',5);	
bw2	=	imclose(bw,se);	
imshow(bw),	title('Imagen	Binaria')	
figure,	imshow(bw2),	title('Cierre')	

%% Visualizar	más	claramente	las	%diferencias entre	las	imágenes, crearemos	una	imagen compuesta.	
[h,w]	=	size(bw);	
J	=	zeros(h,w,3);	
J(:,:,1)=bw;	
J(:,:,2)=bw2;	
imshow(J)	

%% 1 0 0;1 0 1;0 0 1 --> 1 0 0;1 1 1;0 0 1 PUENTE conecta pizeles antes no conectados

%amarillo en las dos imagenes
%Rojo original
%Verde modificada

I	=	imread('pillsetc.png');	
I	=	im2bw(I);	
J	=	bwmorph(I,'bridge');	
[h,w]	=	size(I);	
K = zeros(h,w,3);	
K(:,:,1) = I;	
K(:,:,2) = J;	
imshow(K)

%% 0 0 0;0 1 0;0 0 0 --> 0 0 0;0 0 0;0 0 0LIMPIEZA remueve pixeles que se encuentren aislados

I	=	imread('pillsetc.png');	
I	=	imnoise(I,	'salt & pepper',0.01);	
I	=	not(im2bw(I));	
J	=	bwmorph(I,	'clean');	
[h,w]	=	size(I);	
K = zeros(h,w,3);	
K(:,:,1) = I;	
K(:,:,2) = J;	
imshow(K)

%% 1 1 1;1 0 1;1 1 1 --> 1 1 1;1 1 1;1 1 1 LLENADO elimina huecos en un objeto cuyo tamaño no supere un pixel
I	=	imread('pillsetc.png');	
I	=	imnoise(I,	'salt & pepper',0.01);	
I	=	im2bw(I);	
J	=	bwmorph(I,	'fill');	
[h,w]	=	size(I);	
K = zeros(h,w,3);	
K(:,:,1) = I;	
K(:,:,2) = J;	
imshow(K)

%% REMOVER  remueve	los	píxeles	interiores,
% Cambia un	píxel	a 0	si	sus	4 vecinos	Tenen	como valor	1.	
I	=	imread('pillsetc.png');	
I	=	im2bw(I);	
J	=	bwmorph(I,	'remove');	
imshow(J);

%% Esqueletizacion --> util para encontrar caracteristicas de un objeto 
% detectar piezas defectuosas-- se busca el punto de borde mas cercano sin romper conectividad
I = imread('rice.png');
level =	graythresh(I)/1.32;	
BW = im2bw(I,level); % umbralizar
for	i=1:45
I=bwmorph(I,'skel');	
imshow(I);	
end

I2=bwmorph(I,'skel',inf);	
figure
imshow(I2);

%% Eliminacion del ruido skel - combinacion de un opening seguido de un closingm 
se	=	strel('disk',15);	
J=imopen(I,se);	
imshow(J)	
K=imclose(J,se);	
figure;	
imshow(K)

