function [value] = estimate3(times,num,lambda)
value=zeros(times,1);
for i=1:1:times
    x=random_exp(num,lambda);
    mean_est=mean(x);
    value(i)=1/mean_est;
end
end