function alphapq = momentCentrauxNormPQ(F, p, q)
    mcpq = momentsCentraux(F, p, q);
    mc00 = momentsCentraux(F, 0, 0);
    gama = ((p + q)/2)+1;
    
    alphapq =  mcpq/(mc00)^gama;
end