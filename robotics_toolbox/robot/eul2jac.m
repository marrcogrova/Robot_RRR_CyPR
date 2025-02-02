%EUL2JAC Euler angle rate Jacobian
%
% J = EUL2JAC(EUL) is a Jacobian matrix (3x3) that maps Euler angle rates to 
% angular velocity at the operating point EUL=[PHI, THETA, PSI]. 
%
% J = EUL2JAC(PHI, THETA, PSI) as above but the Euler angles are passed
% as separate arguments.
%
% Notes::
% - Used in the creation of an analytical Jacobian.
%
% See also RPY2JAC, SERIALlINK.JACOBN.


% Copyright (C) 1993-2011, by Peter I. Corke
%
% This file is part of The Robotics Toolbox for Matlab (RTB).
% 
% RTB is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% RTB is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Leser General Public License
% along with RTB.  If not, see <http://www.gnu.org/licenses/>.

function J = eul2jac(phi, theta, psi)

    if length(phi) == 3
        % eul2jac([phi theta psi])
        theta = phi(2);
        psi = phi(3);
        phi = phi(1);
    elseif nargin ~= 3
        error('RTB:eul2jac:badarg', 'bad arguments');
    end
    J = [   
        cos(psi)*sin(theta)   -sin(psi)    0
        sin(psi)*sin(theta)  cos(psi)      0
        cos(theta)           0             1
        ];
        
