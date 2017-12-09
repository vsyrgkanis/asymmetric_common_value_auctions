%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code plots the expected utility of each player as  function of 
% the prior alpha. In addition it plots it for several values of the strength 
% of the binary signal of the more informed bidder p2, while holding still 
% the strength of the less informed bidder.                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p1 = .6;    % Signal strenght of less informed bidder
a=0:0.001:1; % Range and coarseness of the prior for the plot

fig2 = figure;
utily = zeros(length(a),1);
utilz = zeros(length(a),1);

for p2=.6:0.025:1
    
    py = [1-p1 p1]; % Vector of Pr[Xy=s | V=1]
    qy = [p1 1-p1]; % Vector of Pr[Xy=s | V=0]
    
    pz = [1-p2 p2]; % Vector of Pr[Xz=t | V=1]
    qz = [p2 1-p2]; % Vector of Pr[Xz=t | V=0]
    
    for t=1:length(a)
        
        [ub, y, z, cdfy, cdfz]=equilibrium(a(t),py,qy,pz,qz);        
        [nvaly, nvalz] = calculate_all_utilities(a(t),py,qy,pz,qz,ub,y,z,cdfy,cdfz);
        
        utily(t) = sum(nvaly);
        utilz(t) = sum(nvalz);
    end
    
    figure(fig2);
    newplot();
    hold on;
    axis([0 1 0 0.25]);
    plot(a,utily,a,utilz);
    hold off;
    
    pause(0.1);
end
