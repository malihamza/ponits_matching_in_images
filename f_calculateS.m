function S = f_calculateS(Ix, Iy, x, y, w)

     S= zeros(2);
    for i=-floor(w/2):floor(w/2)
        for j=-floor(w/2):floor(w/2)
            S = S + [Ix(x + i, y + j)^2 Ix(x + i, y + j)*Iy(x + i, y + j); 
                 Ix(x + i, y + j)*Iy(x + i, y + j) Iy(x + i, y + j)^2]; 
             
        end
    end
end