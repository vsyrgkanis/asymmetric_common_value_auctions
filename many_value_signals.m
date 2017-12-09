%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code runs the case where one player has an almost continuous signal
% space while the other player is completely informed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

st = 0.01;                               % Coarseness of signal value
py = (0.1:st:1)./(sum(0.1:st:1));        
qy=fliplr(py);
pz = [0 1];                              % Completely informed bidder
qz=[1 0];

% Plot CDFs for a specific value of alpha
a=0.7;
[ub, y, z, cdfy, cdfz]=equilibrium(a,py,qy,pz,qz);
figure;
plot_all_cdfs(a,py,qy,pz,qz,ub,y,z,cdfy,cdfz);

% Plot Utility as a function of alpha
alphas=0.05:0.05:0.95;
for t=1:length(alphas)
	a=alphas(t); 
	[utily_y_wins(t), utilz_y_wins(t)]=expected_utilities(a,py,qy,pz,qz);
end
figure;
plot(alphas,utily_y_wins,'r',alphas,utilz_y_wins,'g');