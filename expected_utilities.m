function [utily, utilz] = expected_utilities(a,py,qy,pz,QX)

[ub, y, z, cdfy, cdfz]=equilibrium(a,py,qy,pz,QX);
[nvaly, nvalz] = calculate_all_utilities(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz);
		
utily = sum(nvaly);
utilz = sum(nvalz);