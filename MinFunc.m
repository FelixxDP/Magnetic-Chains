function mf = MinFunc(tau,param_vec)
%MINFUNC    Summary of this function goes here
%   Detailed explanation goes here
%   PARAM_VEC is a 5*Nx1 vector of the form: 
%                     [ x1
%                       y1
%                       z1
%                       t1
%                       p1
%                       .
%                       .
%                       .
%                       xn
%                       yn
%                       zn
%                       tn
%                       pn ]

radius = 10^-3; % MAKE ARGUMENT?
param_mat   = reshape(param_vec,5,[]);
X           = param_mat(1:3,:,:);
TH          = param_mat(4:5,:,:);
[Mx My Mz]  = sph2cart(TH(1,:,:),TH(2,:,:),1);
M           = [Mx ; My ; Mz];

inertia = 10^6; % MAKE ARGUMENT?
F = Force(X,M,radius)/inertia;
T = torque(X,M);

mf = ColumnOut(F,T);

end

