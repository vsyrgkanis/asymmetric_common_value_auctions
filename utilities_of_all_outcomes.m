%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function returns the utilities of the players for each of the four
% possible outcomes when the bidders hold some symmetric binary signal 
% p_Y, p_Z and the seller also is selling some symmetric binary signal q.
% U1Y, U1Z: Utilities if Y wins
% U2Y, U2Z: Utilities if Z wins
% U3Y, U3Z: Utilities if both win
% U4Y, U4Z: Utilities if neither wins
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [U1Y,U1Z,U2Y,U2Z,U3Y,U3Z,U4Y,U4Z] = utilities_of_all_outcomes(p1,p2,q,a)

%% What if player Y wins the signal q
%py = [(1-p1)*(1-q) p1*(1-q) q*(1-p1) p1*q]; % Player Y now has a four valued signal
py = sort([(1-p1)*(1-q) p1*(1-q) q*(1-p1) p1*q]); % Player Y now has a four valued signal
%qy = [p1*q q*(1-p1) p1*(1-q) (1-p1)*(1-q)];
qy = sort([p1*q q*(1-p1) p1*(1-q) (1-p1)*(1-q)], 'descend');

pz = [1-p2 p2]; % Player Z has a binary signal
qz = [p2 1-p2];
[U1Y, U1Z] = expected_utilities(a,py,qy,pz,qz);

%% What if player Z wins the signal q
py = [1-p1 p1]; % Player Y has a binary signal
qy = [p1 1-p1];

%pz = [(1-p2)*(1-q) p2*(1-q) q*(1-p2) p2*q]; % Player Z now has a four valued signal
pz = sort([(1-p2)*(1-q) p2*(1-q) q*(1-p2) p2*q]); % Player Z now has a four valued signal
%qz = [p2*q q*(1-p2) p2*(1-q) (1-p2)*(1-q)];
qz = sort([p2*q q*(1-p2) p2*(1-q) (1-p2)*(1-q)], 'descend');

[U2Y, U2Z] = expected_utilities(a,py,qy,pz,qz);

%% What If both players get the signal
py = [1-p1 p1];
qy = [p1 1-p1];

pz = [1-p2 p2];
qz = [p2 1-p2];

% If the signal comes 1 then just update the prior to the new prior which
% will just Pr[V=1|X=H]=Pr[X=H|V=1]Pr[V=1]/Pr[X=H]
a1 = a*q/(a*q+(1-a)*(1-q));
% Then calculate utilities using the updated prior
[utily1, utilz1] = expected_utilities(a1,py,qy,pz,qz);

% else if the signal comes 0 then update again the prior to the new one
% which will be Pr[V=1|X=L]=Pr[X=L|V=1]Pr[V=1]/Pr[X=L]
a2 = a*(1-q)/(a*(1-q)+(1-a)*q);
% Then calculate utilities using the updated prior
[utily2, utilz2] = expected_utilities(a2,py,qy,pz,qz);

% The total utilities are the expected utility from the two outcomes
U3Y = (a*q+(1-a)*(1-q))*utily1+(a*(1-q)+(1-a)*q)*utily2;
U3Z = (a*q+(1-a)*(1-q))*utilz1+(a*(1-q)+(1-a)*q)*utilz2;

%% What if no player gets the signal
py = [1-p1 p1];
qy = [p1 1-p1];
	
pz = [1-p2 p2];
qz = [p2 1-p2];

[U4Y, U4Z] = expected_utilities(a,py,qy,pz,qz);

