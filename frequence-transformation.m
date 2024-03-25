%% Transformacion a fin
%projective' Las líneas paralelas dejan de serlo.

T	=	maketform('affine',[.5	0  0;	.5	2	0;	0	0	1]);	
tformfwd([10	20],T)	
I1	=	imread('cameraman.tif');	
I2	=	imtransform(I1,T);	
imshow(I2),	figure,	
imshow(I2)	

%% detector de bordes verticales CONVOLUCION
I=ones(200,200);	
I(21:180,21:180)=zeros(160,160);	
J=conv2(I,[-1	0	1;-1	0	1;-1	0	1]);	
subplot(2,1,1)	
imshow(I)	
subplot(2,1,2)	
imshow(J,[])

%% detector de bordes horizontales CONVOLUCION
kernelTranspuesto = [-1 -1 -1; 0 0 0; 1 1 1 ];
I=ones(200,200);	
I(21:180,21:180)=zeros(160,160);	
J2=conv2(I,kernelTranspuesto);	
subplot(2,1,1)	
imshow(I)	
subplot(2,1,2)	
imshow(J2,[])	

%% convolucion a una imagen
I=imread('pout.tif');	
J=conv2(I,	[-1	0	1;-1	0	1;-1	0	1]);	
subplot(2,1,1)	
imshow(I)	
subplot(2,1,2)	
imshow(J,[])	

%% Patron de busqueda 

I=imread('cameraman.tif');	
I=rgb2gray(I);	
J= imcrop(I,[50 50 100 100]);	
K=normxcorr2(J,I);	
imshow(K);	

%% Patro de busqueda

Patron = imread('Triangulo.bmp');
Imagen = imread('Iluminati.bmp');
img = normxcorr2(Patron,Imagen);
imshow(img,[]);

%% Series de fourier

y = zeros (length(0:0.1:2*pi));
for k=0:20
    i = 0 ;
    for t=0:0.1:2*pi
        i = i+1;
        y(i)= y(i)+(sin((2*k+1)*t))/(2*k+1);
    end
end
plot(0:0.1:2*pi,y)

%% Transformada de fourier para onda bidimensional 

%	x=sin(0:0.1:6*pi);	

x=0.5+0.5*sin(0:0.1:6*pi);	
for	i=1:100	
y(i,:)=x;	
end	

figure,	imshow(y)	
J=fft2(y);	

figure,	imshow(abs(J),[])	
J1=fftshift(J);

figure,	imshow(abs(J1),[])	

%j2 = ifftshift(j1);
%j3= ifft2(j2);

%figure,imshow(abs(j2),[])

%% Transformada de fourier para un circulo

I2=imread('circulo.png');	
I2=rgb2gray(I2);	
J2=x2(I2);	
figure,	imshow(J2)	
J3=fftshift(J2);	
figure,	imshow(J3)	
figure,	imshow(abs(J3),[])	
%e	inversamente:	
Ir=ix2(J2);	
figure,	imshow(Ir);	






%% Filtrado en frecuencia
%Ingresamos	a	Matlab	una	imagen	limpia en	escala	de	grises.	
I=imread('cameraman.tif');	

%Generamos	la	señal	de	ruido	
Ruido = zeros(256,256);
x=0:255;	
for	i=1:256	
Ruido(i,:)=60*(sin(x+i)+1);	
end
Im_ruidosa=double(I)+Ruido;

%Visualizamos	las	imágenes	
subplot(1,3,1);imshow(I,[]);	
subplot(1,3,2);imshow(Ruido,[]);	
subplot(1,3,3);imshow(Im_ruidosa,[]);

imfurier= fft2(Im_ruidosa);
imfiltrada= ifft2(imfurier);

subplot(2,1,1);imshow(imfurier);	
subplot(2,1,2);imshow(imfiltrada,[]);	

%% Suma de ruido a la imagen

%Ingresamos	a	Matlab	una	imagen	limpia	
%en	escala	de	grises.	
I=imread('cameraman.tif');	
%Generamos	la	señal	de	ruido	
Ruido = zeros(256,256)	;
x=0:255;	
for	i=1:256	
	Ruido(i,:)=60*(sin(x+i)+1);	
end	

%Sumamos	la	imagen	y	el	ruido	
Im_ruidosa=double(I)+Ruido;	
%Visualizamos	las	imágenes	
subplot(1,3,1);imshow(I,[]);	
subplot(1,3,2);imshow(Ruido,[]);	
subplot(1,3,3);imshow(Im_ruidosa,[]);	

%Aplicamos	transformada	de	Fourier	
%bidimensional	a	las	imágenes.	
If=fft2(I);	
Ruidof=fft2(Ruido);	
Im_ruidosaf=fft2(Im_ruidosa);	

%Visualizamos	las	imágenes	
figure;	
subplot(1,3,1);imshow(log(abs(If)),[]);	
subplot(1,3,2);	
imshow(log(abs(Ruidof)),[]);	
subplot(1,3,3);	
imshow(log(abs(Im_ruidosaf)),[]);	

%% Filtrado usando mascara , mapa de bits monocromatica encima de los destellos

Ie=log(abs(Im_ruidosaf));	
minimo=min(min(Ie));	
maximo=max(max(Ie));	
Ie=(Ie-minimo)/(maximo-minimo);	

%imwrite(Ie,'Ie.bmp');	

mascara=imread('mascara.bmp');	
M_IRf=Im_ruidosaf.*double(mascara);	

%Visualizamos	el	resultado	en	ambos dominios	
figure;	
imshow(log(abs(M_IRf)),[]);	
figure;	
imshow(ifft2(M_IRf),[]);	










