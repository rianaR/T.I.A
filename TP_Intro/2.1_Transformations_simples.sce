xdel(winsid());
lena = double(imread("images/lena.bmp"));
//Thresholding
seuil = 128;
thrs = (lena > seuil)*255;
imshow(thrs/255);
imwrite(thrs/255,'2.1.1.jpg');
//Négatif
negatif = 255-lena;
//imshow(negatif/255);
imwrite(negatif/255,'2.1.2.jpg');
