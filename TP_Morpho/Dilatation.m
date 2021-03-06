function dil=Dilatation(im,x,y)
%--------------------------------------
% Entrees : im   -> image initiale
%           x, y -> parametres de l'element structurant
% Sortie :  dil  -> resultat de la dilatation
%--------------------------------------

% --> COMPLETEZ LA FONCTION
    [lines, columns] = size(im);
    dil = zeros(size(im));
    for l=1:lines
        for c=1:columns
            rect = im(max(1,l-y):min(lines, l+y),max(1,c-x):min(columns,c+x));
            dil(l,c) = max(rect(:));
        end
    end
end

