%% deteccion de movimiento 
% diferencia entre imagenes punto a punto, valor absoluto, calculo de energia del movimiento
% proyectiva puntos homogeneos ideales vs euclidea hetereogeneos 

I = imread('Big_ben_closeup.jpg');
imshow(I)
[bw,xi,yi] = roipoly;
udata = [0 1];
vdata = [0 1];
tform = maketform('projective', [xi(1) yi(1); xi(2) yi(2); xi(3) yi(3); xi(4) yi(4)],[ 0 0; 1 0; 1 1; 0 1]);

[B,xdata,ydata]  = imtransform(I, tform, 'bicubic','udata', [xi(1) xi(3)],'vdata',[yi(1) yi(4)],'size',size(I),'fill',128);
figure,
imshowpair(I,B,'montage');

%% Reconstruccion reconstruir las coordenadas de un punto 3D a partir de sus vistas.
   % se estima a partir de sus distintas proyecciones obtenidas de las imagenes

close all;
clear  all;
I1 = imread('Iluminati.bmp');
L1 = bwlabel(im2bw(I1));
T1 = regionprops(L1, 'centroid');
c1x = T1.Centroid(1);
c1y = 256 - T1.Centroid(2);

% Reconstruccion 3D-lineal

axis off
hold on; 
plot3([1 1]*c1x/256, [0 1], [1 1]*c1y/256);
%mapea una imagen en un cubo
warp([0 1;1 0],ones(2,2),[1 1;0 0],I1);
plot3([0 1], [1 1]*c2x/256, [1 1]*c2y/256);


warp(zeros(2,2), [1 1;0 0], [1 0;1 0], imrotate(I2,90));
plot3([1 1]*c1x/256, [1 1]*c2x/256, [1 1]*c2y/256, 'ob');
axis off
