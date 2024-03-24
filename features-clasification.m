 %% ESTRUCTURA DE UN CLASIFICADOR
  %extraer caracteristicas relevantes reduciendo el volumen de informacion para hacerla manejable. (area, perimetros, centros, etc..)
  % Problema --> determinar las caracteristicas que permiten distinguir un objeto de otro, esta caracteristica depende que cada problema.
  % FUNCION DISCRIMINANTE --> clasificar dependiendo de una ecuacion lineal
  
 %% CARACTERISTICAS
  % Discriminación --> las características deben tomar valores distintos (Diferentes Clases)
  % Fiabilidad --> las caracteristicas deben tomar valores similares (Misma Clase)
  % Independencia --> no deben estar correlacionadas, pq reflejarian la misma propiedad del objeto
  % Numero --> deben haber la menor cantidad de caracteristicas posibles
  
 %% RECONOCIMIENTO 
  % estadistico --> uso de funciones de probabilidad (patron mas similar)->BAYESIANO
  % sintactico --> estructura de los objetos ej: esqueleto
  % redes neuronales --> imitar el funcionamiento de sistemas biologicos

%% AGRUPAMIENTO 
  % Agrupamiento de datos Clustering --> se agrupan por si solos
  % Distancias encadenatas --> Elige un elemento al azar y calcula distancias de el recorriendo los elementos mascercanos y analiza las
  % distancias euclidianas enter cada elemento
  % Max Min --> Elige un elemento al azar, se obtiene la distancia euclidiana al resto de elementos y dependiendo de la minima o maxima distancia entre
  % elementos decide si es necesario formar mas clases.
  

%% Clasificación - Metodo k-means (establece distancia media entre cada punto)

X1	=	[randn(100,2)+ones(100,2);
randn(100,2)-ones(100,2)];	
opts=statset('Display','final');	

[idx,ctrs]=	kmeans(X1,2,'Distance','city','Replicates',5,'Options',opts);	
figure,	
plot(X1(idx==1,1),X1(idx==1,2),'r.','MarkerSize',12)	
hold	on	
plot(X1(idx==2,1),X1(idx==2,2),'b.','MarkerSize',12)	
plot(ctrs(:,1),ctrs(:,2),'kx','MarkerSize',12,'LineWidth',2)	
legend('Cluster	1','Cluster	2','Centroids','Location','NW');	

%% Clasificación Transformacion de componentes (PCA) si se aplican transformaciones lo datos se vuelven mas separables (covarianza)

load	hald;	
size(ingredients)	
[coeff,score,latent]	=	pca(ingredients);	
figure(1);subplot(1,2,1),plot(ingredients(:,1),ingredients(:,2),'bx');	
subplot(1,2,2),plot(ingredients(:,3),ingredients(:,4),'bx');	
		
figure(2);subplot(1,2,1),plot(score(:,1),score(:,2),'bx');	
subplot(1,2,2),plot(score(:,3),score(:,4),'bx');	

%% Transformacion de componentes

I0=imread('peppers.png');	
[m,n,c]=size(I0);	
I=reshape(I0,m*n,c);	
I=double(I)./255;	
		
[coeffI,scoreI,latentI]	=	pca(I);	
		
figure(3);subplot(1,3,1),	
imshow(I0(:,:,1));	
subplot(1,3,2),imshow(I0(:,:,2));	
subplot(1,3,3),imshow(I0(:,:,3));	
		
scoreI1=reshape(scoreI,m,n,c);	
figure(4);subplot(1,3,1),	
imshow(scoreI1(:,:,1),[]);
%imshow(scoreI2(:,:,1));	
subplot(1,3,2),imshow(scoreI1(:,:,2),[]);	
subplot(1,3,3),imshow(scoreI1(:,:,3),[]);	
		
figure(5);subplot(1,2,1),	
plot(I(:,1),I(:,2),'bx');	
subplot(1,2,2),plot(I(:,1),I(:,3),'bx');	
figure(6);subplot(1,2,1),	
plot(scoreI(:,1),scoreI(:,2),'bx');	
subplot(1,2,2),	
plot(scoreI(:,1),scoreI(:,3),'bx');	

%%
maxI = max(scoreI1(:));
minI = min(scoreI1(:));
scoreI2 = (scoreI1 - minI)./(maxI-minI);
figure(8), imshow(scoreI2)

%%	Analize	image	rice.png	

I=imread('rice.png');	
background	=	imopen(I,strel('disk',15));	
I2	=	I	-	background;	
I3	=	imadjust(I2);	
level	=	graythresh(I3);	
bw	=	im2bw(I3,level);	
bw	=	bwareaopen(bw,	50);	
bw2	=	bwperim(bw);	
		
area=regionprops(bw,'Area','Perimeter','centroid','orientation');	
		
X=[cat(1,area.Area)	cat(1,area.Perimeter)];	

%% K-means Clustering

x = inputdlg('Enter number of clusters that you wish(maximum 7):','Sample',170);
separacion = str2num(x{:});
if separacion > 7
h = msgbox('The operaLon cannot be made, max number for clusters is 7');
return
end
[idx,C] = kmeans(X,separacion,'Replicates',5); %'Distance','cityblock',
colors=['r''b''m''g''k''c''y'];
figure,
for i=1:separacion
plot(X(idx==i,1),X(idx==i,2),strcat(colors(i),'.'),'MarkerSize',12)
hold on
end
xlabel('Area'),ylabel('Perimeter')
plot(C(:,1),C(:,2),'kx','MarkerSize',12,'LineWidth',2)
title 'Cluster Assignments and Centroids'
holdoff

%% Funciones de base Rabial (RBF)
% gran velocidad de aprendizaje, hibrido(supervisado y no supervisado)
% calculan distancias entre vector de entrada y el centroide de la funcion de Radbas
% MLP --> rango infinito RBF --> localmente
% el comportamiento es el mismo para los nodos cuya distancia al centroide es la misma 
% algoritmo autoorganiszado jerarquico -- tamaño de la capa oculta - determina el k-means automaticamente para clustering


%entrenamiento
clear
close all 
clc
Ia=im2bw(imread('ima.bmp'));
La=bwlabel(Ia);
Ta=regionprops(La,'Eccentricity','Area','Orientation');

Ie=im2bw(imread('ime.bmp'));
Le=bwlabel(Ie);
Te=regionprops(Le,'Eccentricity','Area','Orientation');
Ii=im2bw(imread('imi.bmp'));
Li=bwlabel(Ii);
Tip=regionprops(Li,'Eccentricity','Area','Orientation');
Ti.Eccentricity = Tip(2).Eccentricity;
Ti.Area = Tip(2).Area;
Ti.Orientation=Tip(2).Orientation;

Io=im2bw(imread('imo.bmp'));
Lo=bwlabel(Io);
To=regionprops(Lo,'Eccentricity','Area','Orientation');
Iu=im2bw(imread('imu.bmp'));
Lu=bwlabel(Iu);
Tu=regionprops(Lu,'Eccentricity','Area','Orientation');


Tav = [Ta.Eccentricity Ta.Area Ta.Orientation];
Tev = [Te.Eccentricity Te.Area Te.Orientation];
Tiv = [Ti.Eccentricity Ti.Area Ti.Orientation];
Tov = [To.Eccentricity To.Area To.Orientation];
Tuv = [Tu.Eccentricity Tu.Area Tu.Orientation];
entradas = [Tav' Tev' Tiv' Tov' Tuv'];
salidas = [1 2 3 4 5];
red = newrb(entradas,salidas,0,1,5,1);

% funcion colorear --> colorea etiquetas

% clasificar
clc
close
I = imread('inimagen.bmp');
Ib = im2bw(I);
[L,num] = bwlabel(Ib);
T = regionprops(L,'Eccentricity','Area','Orientation');
J = I;
for i=1:num
    letra = [T(i).Eccentricity; T(i).Area; T(i).Orientation];
    y = round(sim(red,letra)*1e10)/1e10;
switch y 
    case 1
        J = colorear(L,i,255,0,0,J);
    case 2
        J = colorear(L,i,0,255,0,J);
    case 3
        J = colorear(L,i,0,0,255,J);
    case 4
        J = colorear(L,i,255,255,0,J);
    case 5
        J = colorear(L,i,0, 255,255,J);
end
end
imshow(J)





