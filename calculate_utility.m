%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the expected equilibrium utility conditional on a signal draw. 

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
% w : player index, either {1, 2}, for which to calculate conditional expected utility
% s : signal index for which to calculate conditional expected utility 
% 
% Returns
% -------
% nval : the expected equilibrium utility of player w conditional on getting signal s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function nval = calculate_utility(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz,w,s)

if w==1
    intervals = find(y==s);
    t = intervals(1);
    PrYZ=a*py(y(t))*pz(z(t))+(1-a)*qy(y(t))*QX(z(t));
    PrY = a*py(y(t))*sum(pz(1:z(t)-1))+(1-a)*qy(y(t))*sum(QX(1:z(t)-1));
    nval = (a*py(y(t))*pz(z(t))-ub(t)*PrYZ)*cdfz(t)+a*py(y(t))*sum(pz(1:z(t)-1))-ub(t)*PrY;
else
    intervals = find(z==s);
    t = intervals(1);
    PrYZ=a*py(y(t))*pz(z(t))+(1-a)*qy(y(t))*QX(z(t));
    PrZ=a*pz(z(t))*sum(py(1:y(t)-1))+(1-a)*QX(z(t))*sum(qy(1:y(t)-1));
    nval = (a*py(y(t))*pz(z(t)) - ub(t)*PrYZ)*cdfy(t)+a*pz(z(t))*sum(py(1:y(t)-1))-ub(t)*PrZ;
end





