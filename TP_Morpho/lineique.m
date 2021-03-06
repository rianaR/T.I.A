function bin=lineique(name1,name2, x, y, bas, haut)
%------------------------------------------------------
% function image=lineique(name1,name2 % ?????)
%
% Extraction de reseau routier par morphologie mathematique
%
% Entrees : name1 -> nom de l'image (.png) a traiter (si l'image a traiter
%                    s'apelle ign1.png l'appel se fait avec name1='ign1.png')
%           name2 -> nom pour enregistrer l'image en sortie (ex:
%           'result.png')
%           x -> Param�tre de la largeur de l'�l�ment structurant (L =
%           2x+1)
%           y-> Param�tre de la hauteur de l'�l�ment structurant (H = 2y+1)
%           bas -> valeur basse du seuillage par hysteresis 
%           haut -> valeur haute du seuillage par hysteresis 
%
% Sortie  : bin  -> image binarisee du reseau routier
%------------------------------------------------------

%-- Lecture de l'image de depart
dep = double(imread(name1));  
figure;
imagesc(dep); axis off; axis image; colormap gray;
title('Image initiale');

% --> COMPLETEZ ICI AFIN DE REALISER L'EXTRACTION DU RESEAU ROUTIER
bin = hysteresis(morphofil(dep, x, y), bas, haut);
% -- Affichage du resultat
Afficher_extraction(dep,bin);

% -- Ecriture du resultat
imwrite(bin,name2);