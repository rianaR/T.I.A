xdel(winsid());

//Amelioration de contraste

clown = double((imread("images/CLOWN_LUMI2.BMP")));
//Valeurs minimales et maximales de l'image
a=min(clown(:));
b=max(clown(:));
//Etalage de l'histogramme
CE = ((clown-a)*255)/(b-a);
imshow(CE/255);
//Histogramme de l'image
scf(0);histplot(255,CE, normalization = %f);
