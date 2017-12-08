%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes an equilibrium and calculates expected utilities of each bidder
% Parameters
% a : the prior probability of V=1
% py : the array of probabilities of Pr[Y=y | V=1]
% qy : the array of probabilities of Pr[Y=y | V=0]
% pz : the array of probabilities of Pr[Z=z | V=1]
% QX : the array of probabilities of Pr[Z=z | V=0]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [utily, utilz] = expected_utilities(a,py,qy,pz,QX)

[ub, y, z, cdfy, cdfz]=equilibrium(a,py,qy,pz,QX);
[nvaly, nvalz] = calculate_all_utilities(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz);
		
utily = sum(nvaly);
utilz = sum(nvalz);