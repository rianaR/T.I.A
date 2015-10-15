clear();

// 3.2 Applications
img = imread('images/lena.bmp');

// filtre h1 => filtre moyenneur
h1 = ones(3,3)/9;

// filtre h2 => détection des contours
h2 = [  0,1,0;
        1,-4,1;
        0,1,0];
        
img_h1 = imfilter(img, h1);
img_h2 = imfilter(img, h2);

// sauvegarde des images
imwrite(img_h1, 'lena_h1_filter.jpg');
imwrite(img_h2, 'lena_h2_filter.jpg');

// moyenne nullle (pour le bruit à venir)
noise_mean = 0;

// écart-type 20
noise_sigma = 20;

// variance calculée à partir de l'écart-type
noise_var = noise_sigma^2;

// bruit additif aléatoire distribution gaussienne moyenne nulle écart-type 20

// version "à la main"
noisy_img = img + noise_sigma * rand(img,"normal") + noise_mean;

// filtre moyenneur
mean_filter_1 = imfilter(noisy_img, h1);

// filtre médian
median_filter_1 = MedianFilter(noisy_img, [3 3]);

// sauvegarde des images
imwrite(noisy_img, 'lena_noise.jpg');
imwrite(mean_filter_1, 'lena_noise_mean_filter.jpg');
imwrite(median_filter_1, 'lena_noise_median_filter.jpg');

// version en utiliant imnoise mais visiblement ça donne de moins bons résultats
//noisy_img_gaussian = img + imnoise(img, 'gaussian', noise_mean, noise_var);

// bruit poivre et sel
noisy_img_salt = imnoise(img, 'salt & pepper', 0.1);

// filtre moyenneur
mean_filter_2 = imfilter(noisy_img_salt, h1);

// filtre médian
median_filter_2 = MedianFilter(noisy_img_salt, [3 3]);

// sauvegarde des images
imwrite(noisy_img_salt, 'lena_salt.jpg');
imwrite(mean_filter_2, 'lena_salt_mean_filter.jpg');
imwrite(median_filter_2, 'lena_salt_median_filter.jpg');
