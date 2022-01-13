function y = propagation(E, Mat, seuil)
    [L, C] = size(Mat);
    for j = 1 : L
        s = 0;
        for i = 1 : size(E);
            s = s + (E(i) * Mat(j, i));
        end
        s = s + seuil(j);
        y(j) = activation('sigmoide', s);
    end
end