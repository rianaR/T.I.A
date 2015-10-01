xdel(winsid());
lena = double(imread("images/lena.bmp"));
//Thresholding
seuil = 128;
thrs = (lena > seuil)*255;
//imshow(thrs/255);
//Négatif
negatif = 255-lena;
//imshow(negatif/255);
