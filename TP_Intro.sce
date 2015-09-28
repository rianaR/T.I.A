xdel(winsid());
lena = double(RGB2Gray(imread("lena.bmp")));
//u = uint8((u - min(u(:)))/(max(u(:)) - min(u(:)))*255);
figure; ShowImage(lena, 'image');

//Thresholding
seuil = 128;
thrs = (lena > seuil)*255

//Négatif
negatif = 255-lena;

//Contrast enhancement
clown = double(RGB2Gray(imread("CLOWN_LUMI2.BMP")));
a=min(clown(:))
b=max(clown(:))
CE = ((clown-a)*255)/(b-a);
figure; ShowImage(CE, 'Contrast enhancement');

//figure;histplot(8, clown);
//clown
//imshow(clown);
scf();imhist(clown,1,'');
//figure;histplot(8, CE);
[cf, ind] = histc(10, clown, normalization = %f);
HSum = cumsum(cf/len);
clownEtale = 255*cf(ind);
figure; ShowImage(clownEtale, 'Normalization');
figure;histplot(8, ind);
