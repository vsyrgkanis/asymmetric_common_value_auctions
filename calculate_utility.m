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





