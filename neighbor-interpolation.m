function iOut=InterpolacionVecino(width, heigth, imInput)
for i=1:heigth
    for j=1:width
        %%verde
        if(j==1 && i==1)
        imInput(i,j,3)=imInput(i+1,j,3);
        imInput(i,j,1)=imInput(i,j+1,1);
        end
        if(i>1 && j==1)%azul
        if(mod(i,2)==0)
        imInput(i,j,2)=imInput(i-1,j,2);
        imInput(i,j,1)=imInput(i-1,j+1,1);  
        end
        if(mod(i,2)~=0)%verde
        imInput(i,j,3)=imInput(i-1,j,3);
        imInput(i,j,1)=imInput(i,j+1,1);  
        end
        end
        if(i==1 && j>1)%rojo
          if(mod(j,2)==0)
         imInput(i,j,2)=imInput(i,j-1,2);
         imInput(i,j,3)=imInput(i+1,j-1,3);
           end
           if(mod(j,2)~=0)%verde
           imInput(i,j,1)=imInput(i,j-1,1);
           imInput(i,j,3)=imInput(i+1,j,3);  
           end
        end
   if(j>=2 && i>=2)%verde     
     if(mod(i,2)==0 && mod(j,2)==0)
        imInput(i,j,3)=imInput(i,j-1,3);
        imInput(i,j,1)=imInput(i-1,j,1);
        end
        if(mod(i,2)~=0 && mod(j,2)==0)%%rojo
        imInput(i,j,2)=imInput(i,j-1,2);
        imInput(i,j,3)=imInput(i-1,j-1,3);
        end
        if(mod(i,2)==0 && mod(j,2)~=0)%azul
        imInput(i,j,2)=imInput(i,j-1,2);
        imInput(i,j,1)=imInput(i-1,j-1,1);
        end
        if(mod(i,2)~=0 && mod(j,2)~=0)%%verde
        imInput(i,j,1)=imInput(i,j-1,1);
        imInput(i,j,3)=imInput(i-1,j,3);
        end
     end
    end
end
imshow(imInput)
iOut=imInput;
