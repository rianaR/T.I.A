%==========================================================
% TP Restauration d'images par approches variationnelles
% --> Code a completer
%==========================================================
clear all; close all; clc;

% -- Parametres
%lambda = ??;                    % Ponderation de la regularisation de Tychonov d'ordre 1
alpha = 0.25;                     % Pas de la descente de gradient
K = 400;                         % Nomre d'iterations de la descente de gradient
sig2 = 1;                       % Variance du bruit additif Gaussien

% -- Lecture de l'image
x = double(imread('lena.bmp')); % Chargement de l'image reelle x

% -- Construction des operateurs H et H*
% H sera un filtre passe-bas Gaussien de variance 1
h = fspecial('gaussian', 11, 1);

s = (size(h)-1)/2;
    
Hs = zeros(size(x));
Hs(1:s(1)+1,1:s(2)+1) = h(s(1)+1:end,s(2)+1:end);
Hs(end+1-s(1):end,end+1-s(2):end) = h(1:s(1),1:s(2));
Hs(1:s(1)+1,end+1-s(2):end) = h(s(1)+1:end,1:s(2));
Hs(end+1-s(1):end,1:s(2)+1) = h(1:s(1),s(2)+1:end);

%===== Pour l'image à la fin du TP ======
% load('Hs_motion_blur');
% y=double(imread('motion_blur.png'));
%========================================

H = fft2(Hs);       % H, Hx se calculera par ifft2(H.*fft2(x));
Hetoile = conj(H);  % H*, H*x se calculera par ifft2(Hetoile.*fft2(x));

% -- Construction de l'image observee y
y = ifft2(H.*fft2(x)) + sqrt(sig2).*randn(size(x));
% Affichage de l'image observee y
figure(1);imagesc(y);colormap gray;title('Image observee'); axis image; axis off;

% -- Calcul de la solution exacte par Fourier
xsol = ifft2(Hetoile.*fft2(y)./(abs(H).^2));
figure(2);imagesc(xsol);colormap gray; title('Solution exacte par Fourier'); axis image;  axis off;

% -- Descente de gradient
% Initialisation
xk = y;

J = zeros(1, K);    % Fonction de cout
err = zeros(1, K);  % Erreur par rapport a la solution exacte
% Boucle principale
for k=1:K
    % Calcul du gradient
    gradJ = 2*ifft2(Hetoile.*fft2((ifft2(H.*fft2(xk))-y)));
    % Mise a jour de xk
    xk = xk - alpha*gradJ;
    % Calcul de l'erreur et la fonction de cout
    J(k) = norm(ifft2(H.*fft2(xk)) - y,2)^2;  % fonction cout
    err(k) = norm(xk - x, 'fro')^2;  % erreur entre xk et l'image originale
    % Affichage
    figure(3);imagesc(xk);colormap gray;title(sprintf('Iteration %d', k)); axis image;  axis off;   
end

% -- Affichages
% Image restauree
figure(3);imagesc(xk);colormap gray;title('Image restauree'); axis image; axis off;
% Image originale
figure(4);imagesc(x);colormap gray;title('Image originale'); axis image; axis off;
% Erreur d'estimation
figure;semilogy(log(err));title('Erreur d''estimation'); grid; xlabel('Nombre d''iterations'); ylabel('Erreur');
% Fonction cout
figure;plot(J);title('Evolution de la fonction cout');grid; xlabel('Nombre d''iterations'); ylabel('Coût');