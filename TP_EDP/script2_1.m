%2.1.m

imOrigins = double(imread('Images/lena.bmp'));
im = double(imread('Images/lena.bmp'));

% moyenne nullle (pour le bruit � venir)
noise_mean = 0;

% �cart-type 20
noise_sigma = 20;

% variance calcul�e � partir de l'�cart-type
noise_var = noise_sigma^2;
noisyImg = im + noise_sigma * randn(size(im)) + noise_mean;
subplot(2,2,1);
imshow(uint8(noisyImg));
title('Lena bruit�e');

dt=0.25;
nbIterations = 100;
edpFiltered = noisyImg;
for i=1:nbIterations
    g=grad2(edpFiltered);
    d=div2(g);
    edpFiltered=edpFiltered+dt*d;
end

subplot(2,2,2);
imshow(uint8(edpFiltered));
title('Lena filtr�e par EDP');
imwrite(edpFiltered/255, 'lena_EDPfilter.jpg');

% �cart-type filtre gaussien
% calcul� en fonction de dt pour avoir 
% des filtrages �quivalents
sigma = sqrt(2 * nbIterations * dt);

gaussianFilter  = fspecial('gaussian', [7, 7], sigma);
% version '� la main'
gFiltered = imfilter(noisyImg, gaussianFilter);
subplot(2,2,3);
imshow(uint8(gFiltered));
title('Lena filtr�e par filtre Gaussien');
imwrite(gFiltered/255, 'lena_GaussianFilter.jpg');

diff = norm(edpFiltered - gFiltered, 2);
disp(sprintf('Norme de la diff�rence entre les r�sultats obtenus : %d',diff));
