function r = activation(nom, x)
    switch nom
        case 'sigmoide'
           r = 1 / (1 + exp(-x));
           
        case 'softmax'
            l = length(x);
            r = zeros(1,l);
            s = 0;
            for i = 1 : l
                s = s + exp(x(i));
            end
            for i = 1 : l
                r(i) = exp(x(i))/s;
            end
    end
    
end