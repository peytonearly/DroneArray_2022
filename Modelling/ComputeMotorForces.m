function motor_forces = ComputeMotorForces(Zc, Lc, Mc, Nc, R, km)
    % Inputs:
    %     Zc - Scalar Z control forces
    %     Lc - Scalar L control moment
    %     Mc - Scalar M control moment
    %     Nc - Scalar N control moment
    %     R  - Radial distance from the center of gravity to the propellers
    %     km - Control moment coefficient
    % 
    % Outputs:
    %     motor_forces - 4x1 vector of motor forces
    % 
    % Methodology:
    %     Use provided equations to find motor forces from the control forces and moments

    M = [-1,         -1,         -1,        -1;
         -R/sqrt(2), -R/sqrt(2), R/sqrt(2),  R/sqrt(2);
         R/sqrt(2),  -R/sqrt(2), -R/sqrt(2), R/sqrt(2);
         km,         -km,        km,         -km];
    
    Fc = [Zc; Lc; Mc; Nc];
    
    motor_forces = M\Fc;
end