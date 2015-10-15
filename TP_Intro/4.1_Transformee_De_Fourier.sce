xdel(winsid());
//lena = double(imread("lena.bmp"));
lena = imread("images/lena.bmp");

//4.1
figure; ShowImage(lena, "Lena");
fftLena = fftshift(fft2(double(lena)));
figure; plot2d(abs(fftLena));
