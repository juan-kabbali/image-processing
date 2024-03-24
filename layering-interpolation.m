function porCapas(imagenDeEntrada)

capaRoja=imagenDeEntrada(:,:,1);
capaVerde=imagenDeEntrada(:,:,2);
capaAzul=imagenDeEntrada(:,:,3);
imsalida(:,:,1)=capaRoja;
imsalida(:,:,2)=capaVerde;
imsalida(:,:,3)=capaAzul;

figure;
subplot(2,2,1);

imshow(capaRoja);
subplot(2,2,2);
imshow(capaVerde);
subplot(2,2,3);
imshow(capaAzul);
subplot(2,2,4);
imshow(imsalida);