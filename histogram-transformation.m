I=imread('r.png');
[h,w,x]=size(I);
J=zeros(h,w,3);
w
IR=I(:,:,1);
IG=I(:,:,2);
IB=I(:,:,3);

minR=double(min(min(IR)));
minG=double(min(min(IG)));
minB=double(min(min(IB)));

maxR=double(max(max(IR)));
maxG=double(max(max(IG)));
maxB=double(max(max(IB)));
for i=1:h
for j=1:w
    
J(i,j,1)=255*((double(IR(i,j))-minR)/(maxR-minR));
J(i,j,2)=255*((double(IG(i,j))-minG)/(maxG-minG));
J(i,j,3)=255*((double(IB(i,j))-minB)/(maxB-minB));

end
end
w
figure, imshow(I);
figure, imshow(J,[]);
imhist(J)

%% Normalizacion
I=imread('pout.tif');
[h,w]=size(I);
J=zeros(h,w);
minimo=double(min(min(I)));
maximo=double(max(max(I)));
for i=1:h
for j=1:w
J(i,j)=255*((double(I(i,j))-minimo)/(maximo-minimo));
end
end
J=uint8(J);
subplot(3,1,1)
imshow(I)
subplot(3,1,2)
imshow(J,[])
subplot(3,1,3)
imhist(J)

%% Inversa
I=imread('pout.tif');
[h,w]=size(I);
J=zeros(h,w);
for i=1:h
for j=1:w
J(i,j)=255-(double(I(i,j)));
end
end
J=uint8(J);
subplot(3,1,1)
imshow(I)
subplot(3,1,2)
imshow(J,[])
subplot(3,1,3)
imhist(J)

%% Cuadrada

I=imread('pout.tif');
[h,w]=size(I);
J=zeros(h,w);
for i=1:h
for j=1:w
J(i,j)=(double(I(i,j)))^2/255;
end
end
J=uint8(J);
subplot(3,1,1)
imshow(I)
subplot(3,1,2)
imshow(J,[])
subplot(3,1,3)
imhist(J)

%% Cubica

I=imread('pout.tif');
[h,w]=size(I);
J=zeros(h,w);
for i=1:h
for j=1:w
J(i,j)=(double(I(i,j)))^3/65535;
end
end
J=uint8(J);
subplot(3,1,1)
imshow(I)
subplot(3,1,2)
imshow(J,[])
subplot(3,1,3)
imhist(J)

%% Raiz cuadrada

I=imread('pout.tif');
[h,w]=size(I);
J=zeros(h,w);
for i=1:h
for j=1:w
J(i,j)=sqrt(double(I(i,j))*255);
end
end
J=uint8(J);
subplot(3,1,1)
imshow(I)
subplot(3,1,2)
imshow(J,[])
subplot(3,1,3)
imhist(J)

%% Logaritmica

I=imread('pout.tif');
[h,w]=size(I);
J=zeros(h,w);
for i=1:h
for j=1:w
J(i,j)=255* (log(1+double(I(i,j)))/log(1+255));
end
end
J=uint8(J);
subplot(3,1,1)
imshow(I)
subplot(3,1,2)
imshow(J,[])
subplot(3,1,3)
imhist(J)

%% Especificacion del histograma

I=imread('pout.tif');
imhist(I)
figure,imshow(I)
[hist1,x]=imhist(I);
J=imread('tire.tif');
figure,
imshow(J)
J1=histeq(J,hist1);
figure,
imshow(J1)

%%
