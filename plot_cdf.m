%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function takes as input the upper bounds of the intervals and the 
% values of the cdfs at the upper bounds of the intervals and plots the CDF
% of signal s of player w.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plot_cdf(a,py,qy,pz,qz,ub,y,z,cdfy,cdfz,w,s)

coarseness=0.0001;  % Coarseness of plotting

hold on;
% If we are asked for cdf of player Y
if w==1
    % Find the intervals that are related with signal s of player Y
    intervals = find(y==s);
    
    % Plot cdf for each interval associated with signal s
    for t=intervals
        % If t is not the lowest/left-most interval (which is just the atom
        % at CVAL{1}{1}
        if t<length(ub)
            % Plot the function in the region of this interval
            b=ub(t+1):coarseness:ub(t);
            
            % Pr[y<y(t),z=z(t)]
            PrZ=a*pz(z(t))*sum(py(1:y(t)-1))+(1-a)*qz(z(t))*sum(qy(1:y(t)-1));
            % Pr[y=y(t),z=z(t)]
            PrYZ=a*py(y(t))*pz(z(t))+(1-a)*qy(y(t))*qz(z(t));
            
            plot(b,((b - ub(t)).*PrZ+(a*py(y(t))*pz(z(t))-ub(t)*PrYZ)*cdfy(t))./(a*py(y(t))*pz(z(t))-b.*PrYZ))
        end
    end
else
    % Similarly for player Z
    intervals = find(z==s);
    
    for t=intervals
        if t<length(ub)
            b=ub(t+1):0.0001:ub(t);
            PrY=a*py(y(t))*sum(pz(1:z(t)-1))+(1-a)*qy(y(t))*sum(qz(1:z(t)-1));
            PrYZ=a*py(y(t))*pz(z(t))+(1-a)*qy(y(t))*qz(z(t));
            
            plot(b,((b - ub(t)).*PrY+(a*py(y(t))*pz(z(t))-ub(t)*PrYZ)*cdfz(t))./(a*py(y(t))*pz(z(t))-b.*PrYZ))
        end
    end
end
	
	hold off;