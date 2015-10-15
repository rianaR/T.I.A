
// gradiant
function [g] = grad2 (im)
    
    // on definit une matice N,M full if 0
    g=zeros(size(im,1),size(im,2),2);
    g(:,1 :end-1:,1)= im(:,2:end)-im(:,1:end-1);
    g(1 end-1:,:,2)= im(2:end,)-im(1:end-1,);
endfunction


// divergence du gradiant
function [d] = div2 (g)

    div1=
   
 
endfunction
