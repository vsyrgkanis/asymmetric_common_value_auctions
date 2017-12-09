%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code plots the CDFs of the bidders for specific instances of the 
% signals. Different examples are commented out. Uncomment the example
% you want to run.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Binary
% p1 = .70;
% p2 = .80;
% a = .7;
% py = [1-p1 p1];
% qy = [p1 1-p1];
% pz = [1-p2 p2];
% qz = [p2 1-p2];

% One Player Two binaries
p1 = .7;
q = .8;
p2 = .7;
a = .8;
py = [(1-p1)*(1-q) p1*(1-q) q*(1-p1) p1*q]; % Player Y now has a four valued signal
qy = [p1*q q*(1-p1) p1*(1-q) (1-p1)*(1-q)];

pz = [1-p2 p2]; % Player Z has a binary signal
qz = [p2 1-p2];


% st = 0.01;                               % Coarseness of signal value
% py = (0.1:st:1)./(sum(0.1:st:1));        
% qy=fliplr(py);
% pz = [0 1];                              % Completely informed bidder
% qz=[1 0];


[ub, y, z, cdfy, cdfz, nvaly, nvalz,utily,utilz]=single_general_instance(a,py,qy,pz,qz)
