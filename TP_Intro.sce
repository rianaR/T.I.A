xdel(winsid());
//lena = double(imread("lena.bmp"));
lena = double(imread("lena.bmp"));

//u = uint8((u - min(u(:)))/(max(u(:)) - min(u(:)))*255);
//figure; ShowImage(lena, 'image');
//imshow(lena/255);

//Thresholding
seuil = 128;
thrs = (lena > seuil)*255
//imshow(thrs/255);
//Négatif
negatif = 255-lena;
//imshow(negatif/255);

//Contrast enhancement
clown = double((imread("CLOWN_LUMI2.BMP")));
a=min(clown(:))
b=max(clown(:))
CE = ((clown-a)*255)/(b-a);
imshow(clown/255);
//scf(1);imhist(imread("CLOWN_LUMI2.BMP"),255,'');






//scf(1);imhist(clown,1,'');
//figure;histplot(255, CE);
//figure;histplot(255, clown);

[cf, ind] = histc(min(clown(:)):max(clown(:)), clown, normalization = %f);

ComplementMoins = zeros(1:min(clown(:)));
ComplementPlus = ones(1:255-max(clown(:)));
HSum = [ComplementMoins,cumsum(cf/(512*512)),ComplementPlus];
plot2d(HSum);
plot2d(cf);
for num_rows = 1:512
        for num_cols = 1:512
            clownEtale(num_rows,num_cols) = 255*HSum(clown(num_rows,num_cols));
            //clownEtale(num_rows,num_cols) = 255*HSum(cf(ind(num_rows, num_cols)));
        end;
end;

imshow(clownEtale/255);

figure;histplot(255,clownEtale);
//scf(1);imhist(clownEtale/,255,'');
//    clownEtale = (clown==i)*255*HSum(i)*512*512;

//Sum = cumsum(clown);

//figure; ShowImage(clownEtale, 'Normalization');


//figure;histplot(255,clownEtale);
