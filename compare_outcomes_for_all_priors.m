%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code plots the utilities of the users in all four outcomes as a 
% function of a. The seller is selling a signal of q and the bidders have
% signals p1 and p2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p1 = .99;
p2 = .75;
q = .75;


alphas=transpose(0.05:0.05:0.95);
U1Y = zeros(length(alphas),1);
U2Y = zeros(length(alphas),1);
U3Y = zeros(length(alphas),1);
U4Y = zeros(length(alphas),1);
U1Z = zeros(length(alphas),1);
U2Z = zeros(length(alphas),1);
U3Z = zeros(length(alphas),1);
U4Z = zeros(length(alphas),1);


for t=1:length(alphas)
	a=alphas(t); 
	[U1Y(t),U1Z(t),U2Y(t),U2Z(t),U3Y(t),U3Z(t),U4Y(t),U4Z(t)] = utilities_of_all_outcomes(p1,p2,q,a);
end


figure;
newplot();
hold on;
axis([0 1 0 0.25]);
plot(alphas,U1Y,'--r',alphas,U2Y,'-.g',alphas,U3Y,'-b',alphas,U4Y,':y');
hold off;
figure;
newplot();
hold on;
axis([0 1 0 0.25]);
plot(alphas,U1Z,'--r',alphas,U2Z,'-.g',alphas,U3Z,'-b',alphas,U4Z,':y');
hold off;
figure;
newplot();
hold on;
axis([0 1 0 1]);
plot(alphas,alphas-(U1Y+U1Z),'--r', ...  % Y
     alphas,alphas-(U2Y+U2Z),'-.g', ... % Z
     alphas,alphas-(U3Y+U3Z),'-b', ... % both
     alphas,alphas-(U4Y+U4Z),':y'); % neither
hold off;

%figure;
%newplot();
%hold on;
%axis([0 1 0 0.25]);
%plot(alphas,U1Y,'r',alphas,U2Y,'g',alphas,U3Y,'b',alphas,U4Y,'y');
%hold off;
%figure;
%newplot();
%hold on;
%axis([0 1 0 0.25]);
%plot(alphas,U1Z,'r',alphas,U2Z,'g',alphas,U3Z,'b',alphas,U4Z,'y');
%hold off;
%figure;
%newplot();
%hold on;
%axis([0 1 0 0.25]);
%plot(alphas,U1Y+U1Z,'r',alphas,U2Y+U2Z,'g',alphas,U3Y+U3Z,'b',alphas,U4Y+U4Z,'y');
%hold off;


