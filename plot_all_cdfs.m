function plot_all_cdfs(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz)

	subplot(2,1,1)
	newplot();
	axis([0 1 0 1]);
	for s = 1:length(py)
		plot_cdf(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz,1,s)
    end
	subplot(2,1,2)
	newplot();
	axis([0 1 0 1]);
	for s=1:length(pz)
		plot_cdf(a,py,qy,pz,QX,ub,y,z,cdfy,cdfz,2,s)
    end