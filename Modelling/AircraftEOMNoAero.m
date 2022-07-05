function dVdt = AircraftEOMNoAero(var, g, m, nu, mu, I)
    % Inputs:
    %     t   - Scalar time
    %     var - 12x1 vector of aircraft state
    %     g   - Scalar gravity
    %     m   - Scalar mass
    %     nu  - Scalar aerodynamic force coefficient
    %     mu  - Scalar aerodynamic moment coefficient
    %     I   - 3x1 vector of inertias
    % 
    % Outputs:
    %     dVdt - 12x1 vector of change in aircraft state variables with time  
    % 
    % Methodology:
    %     Using quadrotor equations of motion to solve for changes in the state variables with time.
    
    % Longitudinal Variables
    phi   = var(4);
    theta = var(5);
    psi   = var(6);
    u     = var(7);
    v     = var(8);
    w     = var(8);
    p     = var(10);
    q     = var(11);
    r     = var(12);

    Ix = I(1);
    Iy = I(2);
    Iz = I(3);

    % Body Frame Deltas
    posDot = [cos(theta)*cos(psi), sin(phi)*sin(theta)*cos(psi)-cos(phi)*sin(psi), cos(phi)*sin(theta)*cos(psi)+sin(phi)*sin(psi);
              cos(theta)*sin(psi), sin(phi)*sin(theta)*sin(psi)+cos(phi)*cos(psi), cos(phi)*sin(theta)*sin(psi)-sin(phi)*cos(psi);
             -sin(theta),          sin(phi)*cos(theta),                            cos(phi)*cos(theta)                           ] * [u; v; w];

    angDot = [1, sin(phi)*tan(theta), cos(phi)*tan(theta);
              0, cos(phi),            -sin(phi);
              0, sin(phi)*sec(theta), cos(phi)*sec(theta)] * [p; q; r];

    Vmag = norm([u, v, w]);
    X    = -nu*u*Vmag;
    Y    = -nu*v*Vmag;
    Z    = -nu*w*Vmag;

    Zc     = -m*g*cos(asin(-Y/(m*g))); % Control force in body frame z 
    velDot = [r*v-q*w; p*w-r*u; q*u-p*v] + g.*[-sin(theta); cos(theta)*sin(phi); cos(theta)*cos(phi)] + (1/m).*[X; Y; Z] + (1/m).*[0; 0; Zc];

    angVelMag = sqrt(p^2 + q^2 + r^2);
    L         = -mu*angVelMag*p;
    M         = -mu*angVelMag*q;
    N         = -mu*angVelMag*r;

    angVelDot = [(Iy-Iz)*q*r/Ix; (Iz-Ix)*p*r/Iy; (Ix-Iy)*p*q/Iz] + [L/Ix; M/Iy; N/Iz];

    dVdt = [posDot; angDot; velDot; angVelDot];

end