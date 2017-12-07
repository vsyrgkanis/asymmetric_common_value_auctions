%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code plots the expected utility of each player as  function of 
% the prior a.                    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p1=1;
p2=.53;

py = [1-p1 p1];
qy = [p1 1-p1];

pz = [1-p2 p2];
QX = [p2 1-p2];

alphas=0:0.001:1;
utily = zeros(length(alphas),1);
utilz = zeros(length(alphas),1);
for t=1:length(alphas)
	a=alphas(t); 
	[utily(t), utilz(t)]=expected_utilities(a,py,qy,pz,QX);
end

figure;
hold on;
axis([0 1 0 0.25]);
plot(alphas,utily,'r',alphas,utilz,'g');
