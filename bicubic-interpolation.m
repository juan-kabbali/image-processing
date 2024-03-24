function matrizAzul=Bicubica(width,height,inputImage)

 rojaOriginal=inputImage(:,:,1);
 verdeOriginal=inputImage(:,:,2);
 azulOriginal=inputImage(:,:,3);
 
 matrizRoja=rojaOriginal(1:2:height,2:2:width);
 matrizVerde1=verdeOriginal(2:2:height,2:2:width);
 matrizVerde2=verdeOriginal(1:2:height,1:2:width);
 matrizVerde(1:2:height,:)=matrizVerde1(1:height/2,:);
 matrizVerde(2:2:height,:)=matrizVerde2(1:height/2,:);

 matrizAzul=azulOriginal(2:2:height,1:2:width);

IR(:,:,1)=imresize(matrizRoja,[height,width],'bicubic');
 
IR(:,:,2)=imresize(matrizVerde,[height,width],'bicubic');
  
IR(:,:,3)=imresize(matrizAzul,[height,width],'bicubic'); 
   imshow(IR);