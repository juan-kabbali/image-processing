%% separado de objetos-reconocimiento de objetos

% etapas ocr Binarización,Fragmentación o segmentación de la imagen,Adelgazamiento de los componentes,Comparación con patrones.

%% Conteo del area

I = imread('im.png');
I = im2bw(I);
L	=	not(bwlabel(I));	
T	=	regionprops(L,'area'); 
R   =   regionprops(L,'perimeter');
imshow(L)
R.Perimeter
T.Area

%% COMPACTICIDAD razón	entre	el	perímetro	al	cuadrado	y	el	área.
c=(T.perimeter^2)/T.Area;
T=regionprops(L,'centroid') % calcular el centro de una figura
T=regionprops(L,'orientation') % retorna el valor en grados del eje principal del objeto

%% CONTEO DE CIRCULOS
rgb	=	imread('coloredChips.png');	
figure	
imshow(rgb)	

d	=	imdistline;	
delete(d);	
gray_image	=	rgb2gray(rgb);	
imshow(gray_image);	

%[centers,	radii]	=	imfindcircles(gray_image,[15 25],'ObjectPolarity','dark')

[centers,	radii]	=	imfindcircles(rgb,[15 25],'ObjectPolarity','bright',	'Sensitivity',0.9); % claros
[centers,	radii]	=	imfindcircles(rgb,[15 25],'ObjectPolarity','dark',	'Sensitivity',0.9); % oscuros

h	=	viscircles(centers,radii);	

%% CONTEO DE ARROZ

I = imread('rice.png');
bw = im2bw(I);
Lim = bwmorph(bw,'clean');

figure,
subplot(2,1,1), imshow(I),title('ORIGINAL')
subplot(2,1,2), imshow(Lim),title('LIMPIA')

lbl = bwlabel(Lim);
color = label2rgb(lbl);
figure, imshow(color);
a = regionprops(lbl,'area','perimeter','orientation','centroid');


for i=1:102
area(i) = a(i).Area;
perimetro(i) =  a(i).Perimeter;
end

figure,

plot(area,perimetro,'rx'), title('Area VS Perimetro');

I=imread('rice.png');	
background	=	imopen(I,strel('disk',15));	
I2	=	I	-	background;	
I3	=	imadjust(I2);	
level	=	graythresh(I3);	
bw	=	im2bw(I3,level);	
bw	=	bwareaopen(bw,	50);	
bw2	=	bwperim(bw);	
		
area=regionprops(bw,'Area','Perimeter','Centroid','Orientation');	
		
X=[cat(1,area.Area)	cat(1,area.Perimeter)];
