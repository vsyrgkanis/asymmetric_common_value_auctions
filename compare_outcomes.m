%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This codes swipes through the whole parameter space to check whether
% if you are selling an extra signal to ex-ante symmetric bidders then
% is it optimal to sell exclusively.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for p=.5:0.01:0.96
    p1=p;
    p2=p;
    for q=p+0.01:0.01:0.95
        alphas=0.05:0.05:0.95;
        for t=1:length(alphas)
            a=alphas(t);
            [U1Y,U1Z,U2Y,U2Z,U3Y,U3Z,U4Y,U4Z] = utilities_of_all_outcomes(p1,p2,q,a);
            if U1Y+U1Z<max(U3Y+U3Z,U4Y+U4Z)
                disp(['a=',num2str(a)]);
                disp(['p=',num2str(p)]);
                disp(['q=',num2str(q)]);
                disp(['Utility if Y wins=',num2str(U1Y+U1Z)]);
                disp(['Utility if both win=',num2str(U3Y+U3Z)]);
                disp(['Utility if none wins=',num2str(U4Y+U4Z)]);
            end
        end
    end
end
display('Finished Searching')