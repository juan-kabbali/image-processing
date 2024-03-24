function psnr(imagenfinal,imageninicial)

x= double(imageninicial);
y= double(imagenfinal);
max=2^16;
mse=(sum(sum(sum(imageninicial - imagenfinal).^2)))/4290*2856*3;
psnr=10*log ((max-1)/mse);
disp(psnr);
