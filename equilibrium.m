%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes an equilibrium of an asymmetric first price common value
% auction. 
%
% Parameters
% ---------- 
% a : the prior probability of V=1
% PY : the array of probabilities of Pr[Y=y | V=1]
% QY : the array of probabilities of Pr[Y=y | V=0]
% PZ : the array of probabilities of Pr[Z=z | V=1]
% QZ : the array of probabilities of Pr[Z=z | V=0]
%
% Returns
% -------
% ub : the common upper bound on the equilibrium bid support
% y : the list of signals of y associated with each interval in the equilibrium
%       interval structure, i.e. y(t) is the signal of Y associated with interval t
% cdfy : value of CDF of Y at upper bound of interval t 
% z : the list of signals of z associated with each interval in the equilibrium
%       interval structure, i.e. z(t) is the signal of Z associated with interval t
% cdfz : value of CDF of Y at upper bound of interval t
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ub,y,z,cdfy,cdfz]=equilibrium(a,PY,QY,PZ,QZ)

% Total number of signal values of the two bidders
ky=length(PY);
kz=length(PZ);

t=1;        % Counter for the current interval from right to left
y(t)=ky;    % Signal of player Y at interval t
z(t)=kz;    % Signal of player Z at interval t
cdfy(t)=1;  % Value of CDF of Y at upper bound of interval t
cdfz(t)=1;  % Value of CDF of Z at upper bound of interval t

% These are the coefficiencts of the linear function that relates 
% the upper bound of interval t with the total upper bound. Specifically
% UB[t] = l(t)*UB - m(t).
l(t)=1;
m(t)=0;

% While we haven't reached an interval where the signal of one player is 
% the lowest.
while y(t)~=1 && z(t)~=1    
    
    % Sum over all y<y(t) of Pr[Xy=y, Xz=z(t)]
    PrZ = a*sum(PY(1:y(t)-1))*PZ(z(t))+(1-a)*sum(QY(1:y(t)-1))*QZ(z(t));
    % Sum over all z<z(t) of Pr[Xy=y(t), Xz=z]
    PrY = a*PY(y(t))*sum(PZ(1:z(t)-1))+(1-a)*QY(y(t))*sum(QZ(1:z(t)-1));
    % Pr[Xy=y(t), Xz=z(t)]
    PrYZ = a*PY(y(t))*PZ(z(t))+(1-a)*QY(y(t))*QZ(z(t));
    
    % If $G_t^Z(UB[t])Pr[Xy<y(t), Xz=z(t)] > G_t^Y(UB[t])Pr[Xy=y(t),Xz<z(t)] 
    if cdfz(t)*PrZ> cdfy(t)*PrY        
        % Then G_t^Y(b) zeros out first and the next interval y(t+1)=y(t)-1
        y(t+1)=y(t)-1;
        z(t+1)=z(t);
        
        % The upper bound of G_t^Y for the next interval is 1 while for
        % G_t^Z is given by continuity
        cdfy(t+1)=1; 
        cdfz(t+1)=(cdfz(t)*PrZ - cdfy(t)*PrY)/(PrZ+PrYZ*cdfy(t));
        
        % Calculate linear coefficients for next interval
        l(t+1) = l(t)*(1+PrYZ*cdfy(t)/PrZ);
        m(t+1) = m(t)*(1+PrYZ*cdfy(t)/PrZ)+a*PY(y(t))*PZ(z(t))*cdfy(t)/PrZ;
        
    elseif cdfz(t)*PrZ < cdfy(t)*PrY
        % Otherwise G_t^Z(b) zeros out first and the next interval
        % z(t+1)=z(t)-1
        y(t+1) = y(t);
        z(t+1) = z(t)-1;
        
        cdfy(t+1) = (cdfy(t)*PrY - cdfz(t)*PrZ)/(PrY + PrYZ*cdfz(t));
        cdfz(t+1) = 1;
        
        l(t+1) = l(t)*(1+(PrYZ*cdfz(t)/PrY));
        m(t+1) = m(t)*(1+(PrYZ*cdfz(t)/PrY))+(a*PY(y(t))*PZ(z(t))*cdfz(t)/PrY);
        
    else
        % Otherwise both zero out simultaneously.        
        y(t+1)=y(t)-1;
        z(t+1)=z(t)-1;
        
        cdfy(t+1)=1;
        cdfz(t+1)=1;
        
        l(t+1) = l(t)*(1+(PrYZ*cdfy(t)/PrZ));
        m(t+1) = m(t)*(1+(PrYZ*cdfy(t)/PrZ))+a*PY(y(t))*PZ(z(t))*cdfy(t)/PrZ;
    end
    t = t+1;
end

% At this point we know that in interval t either y(t)=1 or z(t)=1
if y(t)==1 && z(t)~=1
    
    PrY = a*PY(1)*sum(PZ(1:z(t)-1))+(1-a)*QY(1)*sum(QZ(1:z(t)-1));
    PrYZ = a*PY(1)*PZ(z(t))+(1-a)*QY(1)*QZ(z(t));
    
    % Compute global upper bound UB from the extra equation that we get
    % from zero-utility of Y and from continuity
    ub(1) =(1/l(t))* (m(t) + a*PY(1)*(PZ(z(t))*cdfz(t)+sum(PZ(1:z(t)-1)))/(PrYZ*cdfz(t)+PrY));
    
    % From upper bound compute endpoints of intervals
    for j=2:t
        ub(j) = l(j)*ub(1)-m(j);
    end
    
    % Continue in the next phase of intervals until z(t)=1 too
    while z(t)~=1
        y(t+1) = 1;
        z(t+1) = z(t)-1;
        
        ub(t+1) = a*PY(1)*sum(PZ(1:z(t)-1))/(a*PY(1)*sum(PZ(1:z(t)-1))+(1-a)*QY(1)*sum(QZ(1:z(t)-1)));
        
        cdfy(t+1) = cdfy(t)*(a*PY(1)*sum(PZ(1:z(t)-1))+(1-a)*QY(1)*sum(QZ(1:z(t)-1)))/(a*PY(1)*sum(PZ(1:z(t)-1))+(1-a)*QY(1)*sum(QZ(1:z(t)-1))+(a*PY(1)*PZ(z(t))+(1-a)*QY(1)*QZ(z(t)))*cdfz(t));
        cdfz(t+1) = 1;
        t=t+1;
    end
    
elseif (y(t)~=1 && z(t)==1)
    
    PrZ = a*PZ(1)*sum(PY(1:y(t)-1))+(1-a)*QZ(1)*sum(QY(1:y(t)-1));
    PrYZ = a*PY(y(t))*PZ(1)+(1-a)*QY(y(t))*QZ(1);
    
    ub(1) =(1/l(t))* (m(t) + (a*PZ(1)*(PY(y(t))*cdfy(t)+sum(PY(1:y(t)-1)))/(PrYZ*cdfy(t)+PrZ)));
    
    % From upper bound compute endpoints of intervals
    for j=2:t
        ub(j) = l(j)*ub(1)-m(j);
    end
    
    while y(t)~=1
        z(t+1) = 1;
        y(t+1) = y(t)-1;
        
        ub(t+1) = a*PZ(1)*sum(PY(1:y(t)-1))/(a*PZ(1)*sum(PY(1:y(t)-1))+(1-a)*QZ(1)*sum(QY(1:y(t)-1)));
        
        cdfz(t+1) = cdfz(t)*(a*PZ(1)*sum(PY(1:y(t)-1))+(1-a)*QZ(1)*sum(QY(1:y(t)-1)))/(a*PZ(1)*sum(PY(1:y(t)-1))+(1-a)*QZ(1)*sum(QY(1:y(t)-1))+(a*PZ(1)*PY(y(t))+(1-a)*QZ(1)*QY(y(t)))*cdfy(t));
        cdfy(t+1) = 1;
        t=t+1;
    end
else
    
    ub(1) = (1/l(t))* (m(t) + a*PZ(1)*PY(1)/(a*PZ(1)*PY(1)+(1-a)*QZ(1)*QY(1)));
    % From upper bound compute endpoints of intervals
    for j=2:t
        ub(j) = l(j)*ub(1)-m(j);
    end
end
	
	
