%%
clear
data=[
    7.0000  124.5000    5.7000  122.5000    5.4000  123.4000    5.4000  121.8000    5.4000
    8.0000  129.4000    5.6000  128.1000    5.5000  128.4000    5.5000  127.6000    5.7000
    9.0000  134.6000    6.0000  133.4000    5.4000  134.3000    6.2000  133.5000    6.3000
   10.0000  139.3000    6.6000  138.9000    5.9000  140.0000    6.9000  140.2000    6.6000
   11.0000  145.1000    7.2000  144.9000    6.7000  146.7000    7.0000  146.7000    6.7000
   12.0000  151.2000    8.1000  152.0000    7.8000  152.5000    6.6000  151.9000    6.2000
   13.0000  160.0000    8.0000  159.6000    7.6000  156.3000    6.0000  155.1000    5.4000
   14.0000  165.1000    7.0000  165.1000    6.8000  157.7000    5.5000  156.7000    5.2000
   15.0000  168.3000    6.3000  168.5000    6.2000  158.9000    5.6000  157.4000    5.0000
   16.0000  170.1000    6.3000  170.0000    5.9000  159.3000    5.4000  157.9000    5.3000
   17.0000  171.0000    6.0000  170.8000    6.0000  159.3000    5.4000  158.1000    5.0000
   18.0000  170.8000    5.8000  171.1000    5.9000  159.1000    5.3000  158.2000    5.1000
   ];
c_m_mu=data(:,2);
c_m_sigma=data(:,3);
j_m_mu=data(:,4);
j_m_sigma=data(:,5);
c_f_mu=data(:,6);
c_f_sigma=data(:,7);
j_f_mu=data(:,8);
j_f_sigma=data(:,9);
%%
num_of_age=12;
n1=round(200000/num_of_age/2);
n2=round(200000/num_of_age/2);
test_sigma_m=zeros(num_of_age,1);
test_sigma_f=zeros(num_of_age,1);
for i=1:1:num_of_age
    temp=c_m_sigma(i)/j_m_sigma(i);
    if temp>=1
        test_sigma_m(i)=1-fcdf(temp,n1-1,n2-1);
    else
        test_sigma_m(i)=1-fcdf(1/temp,n2-1,n1-1);
    end
end
for i=1:1:num_of_age
    temp=c_f_sigma(i)/j_f_sigma(i);
    if temp>=1
        test_sigma_f(i)=1-fcdf(temp,n1-1,n2-1);
    else
        test_sigma_f(i)=1-fcdf(1/temp,n2-1,n1-1);
    end
end
test_p1_mu_m=zeros(num_of_age,1);
test_p1_mu_f=zeros(num_of_age,1);
test_t_mu_m=abs(c_m_mu-j_m_mu)./(c_m_sigma.^2/n1+j_m_sigma.^2/n2);
test_t_mu_f=abs(c_f_mu-j_f_mu)./(c_f_sigma.^2/n1+j_f_sigma.^2/n2);
for i=1:1:num_of_age
    test_p1_mu_m(i)=2*(1-tcdf(test_t_mu_m(i),n1+n2-2));
    test_p1_mu_f(i)=2*(1-tcdf(test_t_mu_f(i),n1+n2-2));
end

test_p2_mu_m=zeros(num_of_age,1);
test_p2_mu_f=zeros(num_of_age,1);
test_z_mu_m=abs(c_m_mu-j_m_mu)./(c_m_sigma.^2/n1+j_m_sigma.^2/n2);
test_z_mu_f=abs(c_f_mu-j_f_mu)./(c_f_sigma.^2/n1+j_f_sigma.^2/n2);
for i=1:1:num_of_age
    test_p2_mu_m(i)=2*(1-normcdf(test_z_mu_m(i)));
    test_p2_mu_f(i)=2*(1-normcdf(test_z_mu_f(i)));
end