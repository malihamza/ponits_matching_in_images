function I = f_derivateOfImage(Img,option)
    I = [];
    if(option==2)
        I = Img(:,2:end)-Img(:,1:end-1);
        I = [I zeros(size(Img,1),1)];
    end
    if(option==1)
        I = Img(2:end,:)-Img(1:end-1,:);
        I = [I; zeros(1,size(Img,2))];
    end
end

