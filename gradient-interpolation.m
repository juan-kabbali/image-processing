function Gradiente(width,heigth,imEntrada)
capaRoja=imEntrada(:,:,1);
capaVerde=imEntrada(:,:,2);
capaAzul=imEntrada(:,:,3);
%%plano verde
for i=1:heigth
    for j=1:width
     if(i>2 && i<heigth-1 && j>2 && j<width-1)
       if(mod(i,2)~=0 && mod(j,2)==0)%rojo
         alfa=abs(((capaRoja(i,j-2)+capaRoja(i,j+2))/2)-capaRoja(i,j));
         beta=abs(((capaRoja(i+2,j)+capaRoja(i-2,j))/2)-capaRoja(i,j));
         if(alfa<beta)
         capaVerde(i,j)=mean([ capaVerde(i,j-1)  capaVerde(i,j+1)]);
         end
         if(alfa>beta)
           capaVerde(i,j)=mean([ capaVerde(i+1,j)  capaVerde(i-1,j)]);   
         end
         if(alfa==beta)
           capaVerde(i,j)=mean([ capaVerde(i+1,j)  capaVerde(i-1,j)  capaVerde(i,j-1)  capaVerde(i,j+1)]);   
         end
       end
       if(mod(i,2)==0 && mod(j,2)~=0)%azul
         alfa=abs(((capaAzul(i,j-2)+capaAzul(i,j+2))/2)-capaAzul(i,j));
         beta=abs(((capaAzul(i+2,j)+capaAzul(i-2,j))/2)-capaAzul(i,j)); 
         if(alfa<beta)
         capaVerde(i,j)=mean([capaVerde(i,j-1) capaVerde(i,j+1)]);
         end
         if(alfa>beta)
          capaVerde(i,j)=mean([capaVerde(i+1,j) capaVerde(i-1,j)]);   
         end
         if(alfa==beta)
          capaVerde(i,j)=mean([capaVerde(i+1,j) capaVerde(i-1,j) capaVerde(i,j-1) capaVerde(i,j+1)]);   
         end
       end
      end
    end
end

%%plano rojo
for i=1:heigth
    for j=1:width
        if(i>2 && i<heigth-1 && j>2 && j<width-1)
      if(mod(i,2)==0 && mod(j,2)~=0)
        capaRoja(i,j)=mean([(  capaRoja(i-1,j-1)-capaVerde(i-1,j-1)) (  capaRoja(i+1,j-1)-capaVerde(i+1,j-1)) (  capaRoja(i-1,j+1)-capaVerde(i-1,j+1)) (capaRoja(i+1,j+1)-capaVerde(i+1,j+1))])+capaVerde(i,j);  
      end 
      if(mod(i,2)~=0 && mod(j,2)~=0)
       capaRoja(i,j)=mean([(capaRoja(i,j-1)-capaVerde(i,j-1)) (capaRoja(i,j+1)-capaVerde(i,j+1))])+capaVerde(i,j);  
      end
      if(mod(i,2)==0 && mod(j,2)==0)
       capaRoja(i,j)=mean([(capaRoja(i+1,j)-capaVerde(i+1,j)) (capaRoja(i-1,j)-capaVerde(i-1,j))])+capaVerde(i,j);  
      end
    end
    end
end

%%capa azul
for i=1:heigth
    for j=1:width
        if(i>2 && i<heigth-1 && j>2 && j<width-1)
      if(mod(i,2)~=0 && mod(j,2)==0)
        capaAzul(i,j)=mean([(capaAzul(i-1,j-1)-capaVerde(i-1,j-1)) (capaAzul(i+1,j-1)-capaVerde(i+1,j-1)) (capaAzul(i-1,j+1)-capaVerde(i-1,j+1)) (capaAzul(i+1,j+1)-capaVerde(i+1,j+1))])+capaVerde(i,j);  
      end 
      if(mod(i,2)~=0 && mod(j,2)~=0)
        capaAzul(i,j)=mean([(capaAzul(i+1,j)-capaVerde(i+1,j)) (capaAzul(i-1,j)-capaVerde(i-1,j))])+capaVerde(i,j);  
      end
      if(mod(i,2)==0 && mod(j,2)==0)
        capaAzul(i,j)=mean([(capaAzul(i,j+1)-capaVerde(i,j+1)) (capaAzul(i,j-1)-capaVerde(i,j-1))])+capaVerde(i,j);  
      end
    end
    end
end
imsalida(:,:,1)=capaRoja;
imsalida(:,:,2)=capaVerde;
imsalida(:,:,3)=capaAzul;
imshow(imsalida);