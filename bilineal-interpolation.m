function Bilineal(width, heigth, imEntrada)
% Bilineal(2856,4290,i2);
for i=1:heigth
    for j=1:width
        %Verde
        if(j==1 && i==1)
        imEntrada(i,j,1)=imEntrada(i,j+1,1);
        imEntrada(i,j,3)=imEntrada(i+1,j,3);
        end
        %Azul
        if(i>1 && i<heigth && j==1)
        if(mod(i,2)==0)
        imEntrada(i,j,2)=mean([imEntrada(i-1,j,2) imEntrada(i,j+1,2)]);
        imEntrada(i,j,1)=imEntrada(i-1,j+1,1);  
        end
        %Verde
        if(mod(i,2)~=0)
        imEntrada(i,j,1)=imEntrada(i,j+1,1);
        imEntrada(i,j,3)=mean([imEntrada(i-1,j,3) imEntrada(i+1,j,3)]);  
        end
        
        %Rojo
        end
        if(i==1 && j>1 && j<width)
          if(mod(j,2)==0)
         imEntrada(i,j,2)=mean([imEntrada(i,j-1,2) imEntrada(i+1,j,2)]);
         imEntrada(i,j,3)=imEntrada(i+1,j-1,3);
          end
           %verde
           if(mod(j,2)~=0)
          imEntrada(i,j,1)=mean([imEntrada(i,j+1,1) imEntrada(i,j-1,1) ]);
          imEntrada(i,j,3)=imEntrada(i+1,j,3);  
           end
        end
        %Verde
   if(j>=2 && j<=width-1 && i>=2 && i<=heigth-1)     
     if(mod(i,2)==0 && mod(j,2)==0)
        imEntrada(i,j,3)=mean([imEntrada(i,j-1,3) imEntrada(i,j+1,3)]);
        imEntrada(i,j,1)=mean([imEntrada(i-1,j,1) imEntrada(i+1,j,1)]);
     end
     
     %Verde
        if(mod(i,2)~=0 && mod(j,2)~=0)
        imEntrada(i,j,1)=mean([imEntrada(i,j-1,1) imEntrada(i,j+1,1)]);
        imEntrada(i,j,3)=mean([imEntrada(i-1,j,3) imEntrada(i+1,j,3)]);
        end
        %Rojo
        if(mod(i,2)~=0 && mod(j,2)==0)
        imEntrada(i,j,2)=mean([imEntrada(i-1,j,2) imEntrada(i+1,j,2) imEntrada(i,j-1,2) imEntrada(i,j+1,2)]);
        imEntrada(i,j,3)=mean([imEntrada(i-1,j-1,3) imEntrada(i-1,j+1,3) imEntrada(i+1,j+1,3) imEntrada(i+1,j-1,3)]);
        end
        %Azul
        if(mod(i,2)==0 && mod(j,2)~=0)    
        imEntrada(i,j,1)=mean([imEntrada(i-1,j-1,1) imEntrada(i-1,j+1,1) imEntrada(i+1,j-1,1) imEntrada(i+1,j+1,1)]);
        imEntrada(i,j,2)=mean([imEntrada(i-1,j,2) imEntrada(i,j+1,2) imEntrada(i+1,j,2) imEntrada(i,j-1,2)]);
        end
   end
   
   %Verde
     if(j==width && i==heigth)
      imEntrada(i,j,3)=imEntrada(i,j-1,3);
      imEntrada(i,j,1)=imEntrada(i-1,j,1);
     end
     
     %Rojo
     if(j==width && i==1)
      imEntrada(i,j,2)= mean([imEntrada(i,j-1,2) imEntrada(i+1,j,2)]);
     imEntrada(i,j,3)= imEntrada(i+1,j-1,1);
     end
     %Azul
     if(j==1 && i==heigth)
      imEntrada(i,j,2)= mean ([ imEntrada(i-1,j,2)  imEntrada(i,j+1,2)]);
      imEntrada(i,j,1)=imEntrada(i-1,j+1,1);
     end
     %Verde
     if(j==width && i>1 && i<heigth)
         if(mod(i,2)==0)
     imEntrada(i,j,3)=imEntrada(i,j-1,3);
      imEntrada(i,j,1)=mean([imEntrada(i-1,j,1) imEntrada(i+1,j,1)]);
         end
         %Rojo
         if(mod(i,2)~=0)
       imEntrada(i,j,3)=mean([imEntrada(i-1,j-1,3) imEntrada(i+1,j-1,3)]);
       imEntrada(i,j,2)=mean ([ imEntrada(i-1,j,2) imEntrada(i,j-1,2) imEntrada(i+1,j,2)]);
         end
     end
     %Verde
     if(j>1 && j<width && i==heigth)
        if(mod(j,2)==0)
        imEntrada(i,j,3)= mean([imEntrada(i,j-1,3) imEntrada(i,j+1,3)]);
        imEntrada(i,j,1)= imEntrada(i-1,j,1);
        end
         %Azul
         if(mod(j,2)~=0)
        imEntrada(i,j,2)=mean([imEntrada(i,j-1,2) imEntrada(i-1,j,2) imEntrada(i,j+1,2)]);
        imEntrada(i,j,1)=mean([imEntrada(i-1,j-1,1) imEntrada(i-1,j+1,1)]);
         end
     end
    end
end
imshow(imEntrada)