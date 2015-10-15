//xdel(winsid());

//Amelioration de contraste

clown = double((imread("images/CLOWN_LUMI2.BMP")));
//figure;ShowImage(clown/255, "Clown original");
//Valeurs minimales et maximales de l'image
a=min(clown(:));
b=max(clown(:));
//Etalage de l'histogramme
CE = ((clown-a)*255)/(b-a);
figure; ShowImage(CE/255, "Clown contrasté");
//Histogramme de l'image
//figure; histplot(255,clown, normalization = %f);
figure; histplot(255,CE, normalization = %f);
