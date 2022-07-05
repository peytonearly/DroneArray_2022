function dVdt = AircraftEOMLinear(var, g, m, I, Gc)
    % Inputs:
    %     var - 12x1 vector of aircraft state 
    %     g   - Scalar gravity
    %     m   - Scalar mass
    %     I   - 3x1 vector of inertias
    %     Gc  - 3x1 vector of body frame control moments
    % 
    % Outputs:
    %     dVdt - 12x1 vector of change in aircraft state variable perturbations with time
    % 
    % Methodology:
    %     Use linearized quadrotor equations of motion to solve for changes in the state variable perturbations with time
    
    % Variables
    phi   = var(4);
    theta = var(5);
    uE    = var(7);
    vE    = var(8);
    wE    = var(9);
    p     = var(10);
    q     = var(11);
    r     = var(12);

    Ix  = I(1);
    Iy  = I(2);
    Iz  = I(3);

    Lc  = Gc(1);
    Mc  = Gc(2);
    Nc  = Gc(3);

    dZc = 0;

    % Linear EOM
    dq     = Mc/Iy;
    dtheta = q;
    du     = -g*theta;
    dxE    = uE;

    dp   = Lc/Ix;
    dphi = p;
    dv   = g*phi;
    dyE  = vE;

    dw  = dZc/m;
    dzE = wE;

    dr   = Nc/Iz;
    dpsi = r;

    posDot    = [dxE; dyE; dzE];
    angDot    = [dphi; dtheta; dpsi];
    velDot    = [du; dv; dw];
    angVelDot = [dp; dq; dr];

    dVdt = [posDot; angDot; velDot; angVelDot];
end