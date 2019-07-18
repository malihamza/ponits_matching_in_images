function corners = f_getCorners(Payramid)
    corners = [];
    range = size(Payramid,2);
    for k = 1:range                                                          
        Ix = f_derivateOfImage(Payramid{k},1);
        Iy = f_derivateOfImage(Payramid{k},2);
        
        for i = 2:size(Payramid{k},1)-1
            for j = 2:size(Payramid{k},2)-1 
                       vect= [Ix(i-1,j-1) Iy(i-1,j-1); Ix(i-1,j)   Iy(i-1,j);
                              Ix(i-1,j+1) Iy(i-1,j+1); Ix(i,j-1)   Iy(i,j-1);
                              Ix(i,j)     Iy(i,j)  ;   Ix(i-1,j+1) Iy(i-1,j+1);
                              Ix(i+1,j-1) Iy(i+1,j-1); Ix(i+1,j)   Iy(i+1,j);
                              Ix(i+1,j+1) Iy(i+1,j+1)  ];
                
                sum_mat    = f_sum_matrix(vect);
                [~,minima] = f_maximaAndMinima(sum_mat);
                %corners = [corners ; maxima]; 
                if(minima>0.1056+0.1)
                    vect    = [i,j,k];
                    corners = [corners;vect]; %#ok<AGROW>
                end
            end
        end

    end

end


function mat = f_sum_matrix(vect)
    mat   = zeros(2);
    range = size(vect,1);
    for i=1:range
        mat = mat + [vect(i,1)^2 vect(i,1)*vect(i,2);
                     vect(i,1)*vect(i,2) vect(i,2)^2];
    end

end
