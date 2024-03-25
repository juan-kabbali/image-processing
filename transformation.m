%% Transformaciones geometricas
%rotacion [x y] = [con sin -sin cos][x y]
%escala [x y] = [a 0 b 0][x y]
%estirado shearing [x y] = [1 a 0 1][x y] || [x y] = [1 0 a 1][x y]

%% MaketForm

T = maketform('affine',[.5 0 0; .5 2 0; 0 0 1]);
tformfwd([10 20],T)
I1 = imread('cameraman.tif');
I2 = imtransform(I1,T);
imshow(I2),
figure,
imshow(I2)

%% Puntos de control

I2=imread('peppers.png');
I1=imread('football.jpg');
[Nr,Nc,C]=size(I2);
[xyinput,xybase] = cpselect(I1,I2,'Wait',true);
T=cp2tform(xyinput,xybase,'similarity');
[transI,xdata,ydata] = imtransform(I1,T,'FillValues', 0,'XData',[1 Nc],'Y Data',[1 Nr]);
figure(1),
imshow(I2),
hold on
h = imshow(transI);
set(h,'AlphaData',0.7)
I3=imadd(I2,transI);
figure(2),
imshow(I3)


%% luminosidad,tono,saturacion --> percepcion cerebral
%RGB
%HSI tono,saturacion,brillo -> HSL (lightness) --> HSV (value)
%hue,saturation,intensity
%L*ab* Luminancia a: verdemagenta b: azulamarillo

%% Ecualizacion de componentes

f=imread('football.jpg');
feq(:,:,1)=histeq(f(:,:,1));
feq(:,:,2)=histeq(f(:,:,2));
feq(:,:,3)=histeq(f(:,:,3));
figure;
imshow(f)
figure;
imshow(feq)

%%  NTSC TIQ

I2=imread('peppers.png');
I2ntsc=rgb2ntsc(I2);
figure,
imshow(I2ntsc)

%% PAL YUV

I2yuv=rgb2ycbcr(I2);
figure,
imshow(I2yuv)

%% CMYK

rgb = imread('peppers.png');
figure(1), imshow(rgb)
cform = makecform('srgb2cmyk');
cmyk = applycform(rgb,cform);
figure(2), subplot(2,2,1),
imshow(cmyk(:,:,1)),title('C')
figure(2), subplot(2,2,2),
imshow(cmyk(:,:,2)),title('M'),
figure(2),subplot(2,2,3),
imshow(cmyk(:,:,3)),title('Y'),
figure(2),subplot(2,2,4),imshow(cmyk(:,:,4)),title('K')

