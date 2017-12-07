function [nvaly, nvalz]=calculate_all_utilities(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz)

for s = 1:length(py)
    nvaly(s)=calculate_utility(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz,1,s);
end

for s=1:length(pz)
    nvalz(s)=calculate_utility(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz,2,s);
end