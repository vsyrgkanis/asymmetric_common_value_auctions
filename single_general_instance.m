%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code plots the CDFs and computes the utilities for a general
% instance.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ub, y, z, cdfy, cdfz, nvaly, nvalz,utily,utilz]=single_general_instance(a,py,qy,pz,qz)

[ub, y, z, cdfy, cdfz]=equilibrium(a,py,qy,pz,qz);
[nvaly, nvalz] = calculate_all_utilities(a,py,qy,pz,qz,ub,y,z,cdfy,cdfz);
		
utily = sum(nvaly);
utilz = sum(nvalz);

figure;
plot_all_cdfs(a,py,qy,pz,qz,ub,y,z,cdfy,cdfz);

