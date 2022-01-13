function phi = momentHu(F)
phi = zeros(1, 7);

alpha02 = momentCentrauxNormPQ(F, 0, 2);
alpha20 = momentCentrauxNormPQ(F, 2, 0);
alpha12 = momentCentrauxNormPQ(F, 1, 2);
alpha21 = momentCentrauxNormPQ(F, 2,1);
alpha30 = momentCentrauxNormPQ(F, 3, 0);
alpha03 = momentCentrauxNormPQ(F, 0, 3);
alpha11 = momentCentrauxNormPQ(F, 1, 1);

phi(1) = alpha20 - alpha02;
phi(2) = (alpha20 - alpha02)^2 + 4*alpha11^2;
phi(3) = (alpha30 - alpha12)^2 + (3*alpha12 - alpha03)^2;
phi(4) = (alpha30 - alpha12)^2 + (alpha21 - alpha03)^2;
phi(5) = (alpha30 - 3*alpha12)*(alpha30 - alpha12)*((alpha30 - alpha12)^2 - 3*(alpha21 - alpha03)^2)+(alpha21 - 3*alpha03)*(alpha21 - alpha03)*(3*(alpha30 - alpha12)^2 - (alpha21 - alpha03)^2);
phi(6) = (alpha20 - alpha02)*((alpha30 - alpha12)^2 - (alpha21 - alpha03)^2)+4*alpha11*(alpha21 - alpha03)*(alpha30 - alpha12);
phi(7) = (3*alpha21 - alpha30)*(alpha30 + alpha12)*((alpha30 + alpha12)^2 - 3*(alpha21 + alpha03)^2)+(3*alpha12 - 3*alpha03)*(alpha21 - alpha03)*(3*(alpha30 + alpha12)^2 - (alpha21 - alpha03)^2);
end