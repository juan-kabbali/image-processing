%% RGB
RGB=reshape(ones(64,1)*reshape(jet(64),1,192),[64,64,3]);
R=RGB(:,:,1);
G=RGB(:,:,2);
B=RGB(:,:,3);
imshow(R)
figure, imshow(G)
figure, imshow(B)
figure, imshow(RGB)

%% Guardado de imagen
imwrite(I,'prueba.bmp');
imwrite(I,'prueba.jpg','Quality',80);

%% Barra de colores
I = imread('saturn.png');
I = rgb2gray(I);
h = [1 2 1; 0 0 0; -1 -2 -1];
I2 = filter2(h,I);
imshow(I2,[]), colorbar

%% Visualizacion multiple

A1=imread('peppers.png');
A2=imread('greens.jpg');
imshowpair(A1,A2,'montage')
imshowpair(A1,A2,'blend')
imshowpair(A1,A2,'diff')
imshowpair(A1,A2,'falsecolor')
imshowpair(A1,A2)

%% Texturizar

[x,y,z] = cylinder;
I = imread('t.jpg');
warp(x,y,z,I);

%% Suma de imagenes

I = imread('rice.png');
J = imread('cameraman.tif');
K = imadd(I,J);
imshow(K)

%% suma de una constante
RGB = imread('office_2.jpg');
RGB2 = imadd(RGB,30);
subplot(1,2,1); imshow(RGB);



subplot(1,2,2); imshow(RGB2);