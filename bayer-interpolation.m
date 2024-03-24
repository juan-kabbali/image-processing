function imagendeSalida=filtroBayer(imagen, width, height)
% i=imread('IMG_8626.tiff');
%imshow(i);
%i2=filtroBayer(i,4290,2856);
%imshow(i2);
%% w= 4290 && h=2856
%filtro Bayer
for i=1:width
    for j=1:height
        if(mod(i,2)==0 && mod(j,2)==0)%verde
         imagenFinal(i,j,2)= imagen(i,j);
        end
        if(mod(i,2)==0 && mod(j,2)~=0)%azul
         imagenFinal(i,j,3)= imagen(i,j);
        end
        if(mod(i,2)~=0 && mod(j,2)==0)%rojo
         imagenFinal(i,j,1)= imagen(i,j); 
        end
        if(mod(i,2)~=0 && mod(j,2)~=0) %verde   
         imagenFinal(i,j,2)=imagen(i,j); 
        end
    end
end
  
imagendeSalida=imagenFinal;

