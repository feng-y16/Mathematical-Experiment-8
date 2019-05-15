function [x] = random_exp(num,lambda)
x=rand(num,1);
x=-log(x)/lambda;
end