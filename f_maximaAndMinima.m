function [maxima,minima] = f_maximaAndMinima(S)
%     [U,D,V] = svd(S);
%      D      = sqrt(D);
        [L, D, P, D0] = modchol_ldlt(S);
            S_pert = P'*L*D*L'*P;

            if(isequal(S_pert, zeros(2,2)))
                A = chol(nearestSPD(S_pert));
            else
                A = chol(S_pert);
            end
    [~,D,V] = svd(A);
    [~,idx] = min(diag(D));
     y      = zeros(size(D,2),1);
     y(idx) = 1;
     minima = V*y;
     minima = minima'*S*minima;
     
    [~,idx] = max(diag(D));
     y      = zeros(size(D,2),1);
     y(idx) = 1;
     maxima = V*y;
     maxima = maxima'*S*maxima;
end

