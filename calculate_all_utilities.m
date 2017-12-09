%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate expected utilities from equilibrium CDFs 

% Parameters
% ----------
% a : the prior probability of V=1
% py : the array of probabilities of Pr[Y=y | V=1]
% qy : the array of probabilities of Pr[Y=y | V=0]
% pz : the array of probabilities of Pr[Z=z | V=1]
% QX : the array of probabilities of Pr[Z=z | V=0]
% ub : the common upper bound on the equilibrium bid support
% y : the list of signals of y associated with each interval in the equilibrium
%       interval structure, i.e. y(t) is the signal of Y associated with interval t
% cdfy : value of CDF of Y at upper bound of interval t 
% z : the list of signals of z associated with each interval in the equilibrium
%       interval structure, i.e. z(t) is the signal of Z associated with interval t
% cdfz : value of CDF of Y at upper bound of interval t
% 
% Returns
% -------
% nvaly : array of utilities conditional on each possible signal draw of Y
% nvalz : array of utilities conditional on each possible signal draw of Z
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [nvaly, nvalz]=calculate_all_utilities(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz)

for s = 1:length(py)
    nvaly(s)=calculate_utility(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz,1,s);
end

for s=1:length(pz)
    nvalz(s)=calculate_utility(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz,2,s);
end