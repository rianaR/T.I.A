xdel(winsid());
//lena = double(imread("lena.bmp"));
lena = double(imread("images/lena.bmp"));

//u = uint8((u - min(u(:)))/(max(u(:)) - min(u(:)))*255);
//figure; ShowImage(lena, 'image');
//imshow(lena/255);

//2.1

//Thresholding
seuil = 128;
thrs = (lena > seuil)*255;
//imshow(thrs/255);
//Négatif
negatif = 255-lena;
//imshow(negatif/255);

//2.2

//Amelioration de contraste
clown = double((imread("images/CLOWN_LUMI2.BMP")));
//Valeurs minimales et maximales de l'image
a=min(clown(:));
b=max(clown(:));
//Etalage de l'histogramme
CE = ((clown-a)*255)/(b-a);
imshow(CE/255);
//Histogramme de l'image
//scf(1);histplot(255,CE, normalization = %f);

//scf(1);imhist(clown,1,'');
//figure;histplot(255, CE);
//figure;histplot(255, clown);

//2.3

//Histogramme de l'image là où il y a des valeurs
[cf, ind] = histc(min(clown(:)):max(clown(:)), clown, normalization = %f);

//Calcul de l'histogramme cumulé, complété pour que les valeurs
//soient comprises entre 0 et 255
ComplementMoins = zeros(1:min(clown(:)));
ComplementPlus = ones(1:255-max(clown(:)));
HSum = [ComplementMoins,cumsum(cf/(512*512)),ComplementPlus];

//Egalisation de l'histogramme de l'image clown avec son histogramme cumulé
for num_rows = 1:512
        for num_cols = 1:512
            clownEtale(num_rows,num_cols) = 255*HSum(clown(num_rows,num_cols));
            //clownEtale(num_rows,num_cols) = 255*HSum(cf(ind(num_rows, num_cols)));
        end;
end;

//Affichage de l'image et son histogramme
imshow(clownEtale/255);
figure;histplot(255,clownEtale);
//scf(1);imhist(clownEtale/,255,'');
//    clownEtale = (clown==i)*255*HSum(i)*512*512;

//Sum = cumsum(clown);

//figure; ShowImage(clownEtale, 'Normalization');


//figure;histplot(255,clownEtale);
