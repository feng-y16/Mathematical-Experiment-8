function [value] = estimate1(times,num,lambda,T)
value=zeros(times,1);
for i=1:1:times
    x=random_exp(num,lambda);
    count=sum(x<T);
    p_est=count/num;
    value(i)=-log(1-p_est)/T;
end
end