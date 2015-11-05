function bin=lineique(name1,name2 % ????? )
%------------------------------------------------------
% function image=lineique(name1,name2 % ?????)
%
% Extraction de reseau routier par morphologie mathematique
%
% Entrees : name1 -> nom de l'image (.png) a traiter (si l'image a traiter
%                    s'apelle ign1.png l'appel se fait avec name1='ign1.png')
%           name2 -> nom pour enregistrer l'image en sortie (ex:
%           'result.png')
%
%           %%%% Ajoutez les parametres que vous jugez necessaires  
%
% Sortie  : bin  -> image binarisee du reseau routier
%------------------------------------------------------

%-- Lecture de l'image de depart
dep = double(imread(name1));  
figure;
imagesc(dep); axis off; axis image; colormap gray;
title('Image initiale');

% --> COMPLETEZ ICI AFIN DE REALISER L'EXTRACTION DU RESEAU ROUTIER

% -- Affichage du resultat
Afficher_extraction(dep,bin);

% -- Ecriture du resultat
imwrite(bin,name2);