xdel(winsid());
//lena = double(imread("lena.bmp"));
lena = imread("images/lena.bmp");
imshow(lena)
h = zeros(256,256);
h(1:5,1:5)=1/25;
fftH = (fft2(h));
lenaFft = (fft2(double(lena)));
imFiltre = ifft(lenaFft .* fftH);
figure;ShowImage(real(imFiltre), "Image lissée/floutée");
