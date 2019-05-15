function [value] = estimate2(times,num,lambda,T)
value=zeros(times,1);
for i=1:1:times
    x=random_exp(num,lambda);
    x=x(x<T);
    mean_est=mean(x);
    value(i)=fzero(@(x)(1/x*(1-exp(-x*T))-T*exp(-x*T))/(1-exp(-x*T))-mean_est,1e-3);
end
end