%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate expected utilities from equilibrium CDFs 
% a : the prior probability of V=1
% py : the array of probabilities of Pr[Y=y | V=1]
% qy : the array of probabilities of Pr[Y=y | V=0]
% pz : the array of probabilities of Pr[Z=z | V=1]
% QX : the array of probabilities of Pr[Z=z | V=0]
% ub : the common upper bound on the equilibrium bid support
% y : the list of values associated with the cdfy parameter
% cdfy : the corresponding equilibrium CDF for the list of y's in the y parameter 
% z : the list of values associated with the cdfz parameter
% cdfz : the corresponding equilibrium CDF for the list of z's in the z parameter 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [nvaly, nvalz]=calculate_all_utilities(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz)

for s = 1:length(py)
    nvaly(s)=calculate_utility(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz,1,s);
end

for s=1:length(pz)
    nvalz(s)=calculate_utility(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz,2,s);
end