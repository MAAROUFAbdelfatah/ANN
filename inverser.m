function IF=inverser(F)
[M N]=size(F);
for x=1:M
    for y=1:N
        if(F(x,y)==0)
            F(x,y)=1;
        else
            F(x,y)=0;
        end
    end
end
IF(:,:)=F(:,:);