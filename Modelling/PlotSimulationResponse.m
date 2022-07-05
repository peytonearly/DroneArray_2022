function PlotSimulationResponse(t, state, control, motor, flag)
    % Inputs:
    %   t - Time
    %   state - 12xn vector of aircraft state
    %   control - 12xn vector of control inputs
    %   motor - 12xn vector of motor forces
    %   flag - Boolean used to indicate if trajectory should be plotted
    %
    % Outputs:
    %   (none)
    %
    % Methodology:
    %   This function is used to plot the results of a complete simulation
    %   of aircraft state variables over time

    % Positions
    figure()
    subplot(3, 1, 1)
        plot(t, state(1, :))
        grid on;
        ylabel('X Position [m]')
        xlabel('Time [s]')
    subplot(3, 1, 2)
        plot(t, state(2, :))
        grid on;
        ylabel('Y Position [m]')
        xlabel('Time [s]')
    subplot(3, 1, 3)
        plot(t, state(3, :))
        grid on;
        ylabel('Z Position [m]')
        xlabel('Time [s]')
    sgtitle('Position vs Time')
    saveas(gcf, "Results/Position.png")
    
    % Euler angles
    figure()
    subplot(3, 1, 1)
        plot(t, state(4, :))
        grid on;
        ylabel('Roll Angle [rad]')
        xlabel('Time [s]')
    subplot(3, 1, 2)
        plot(t, state(5, :))
        grid on;
        ylabel('Pitch Angle [rad]')
        xlabel('Time [s]')
    subplot(3, 1, 3)
        plot(t, state(6, :))
        grid on;
        ylabel('Yaw Angle [rad]')
        xlabel('Time [s]')
    sgtitle('Euler Angles vs Time')
    saveas(gcf, "Results/EulerAngles.png")

    % Velocity
    figure()
    subplot(3, 1, 1)
        plot(t, state(7, :))
        grid on;
        ylabel('X Velocity [m/s]')
        xlabel('Time [s]')
    subplot(3, 1, 2)
        plot(t, state(8, :))
        grid on;
        ylabel('Y Velocity [m/s]')
        xlabel('Time [s]')
    subplot(3, 1, 3)
        plot(t, state(9, :))
        grid on;
        ylabel('Z Velocity [m/s]')
        xlabel('Time [s]')
    sgtitle('Velocity vs Time')
    saveas(gcf, "Results/Velocity.png")

    % Angular velocity
    figure()
    subplot(3, 1, 1)
        plot(t, state(10, :))
        grid on;
        ylabel('Roll Rate [rad/s]')
        xlabel('Time [s]')
    subplot(3, 1, 2)
        plot(t, state(11, :))
        grid on;
        ylabel('Pitch Rate [rad/s]')
        xlabel('Time [s]')
    subplot(3, 1, 3)
        plot(t, state(12, :))
        grid on;
        ylabel('Yaw Rate [rad/s]')
        xlabel('Time [s]')
    sgtitle('Euler Angle Rates vs Time')
    saveas(gcf, "Results/EulerAngleRates.png")

    % Controls
    figure()
    subplot(2, 2, 1)
        plot(t, control(1, :))
        grid on;
        ylabel('L_c [N*m]')
        xlabel('Time [s]')
    subplot(2, 2, 2)
        plot(t, control(2, :))
        grid on;
        ylabel('M_c [N*m]')
        xlabel('Time [s]')
    subplot(2, 2, 3)
        plot(t, control(3, :))
        grid on;
        ylabel('N_c [N*m]')
        xlabel('Time [s]')
    subplot(2, 2, 4)
        plot(t, control(4, :))
        grid on;
        ylabel('Z_c [N]')
        xlabel('Time [s]')
    sgtitle('Control Inputs vs Time')
    saveas(gcf, "Results/ControlInputs.png")

    % Motor forces
    figure()
    subplot(2, 2, 1)
        plot(t, motor(1, :))
        grid on;
        ylabel('f_1 [N]')
        xlabel('Time [s]')
    subplot(2, 2, 2)
        plot(t, motor(2, :))
        grid on;
        ylabel('f_2 [N]')
        xlabel('Time [s]')
    subplot(2, 2, 3)
        plot(t, motor(3, :))
        grid on;
        ylabel('f_3 [N]')
        xlabel('Time [s]')
    subplot(2, 2, 4)
        plot(t, motor(4, :))
        grid on;
        ylabel('f_4 [N]')
        xlabel('Time [s]')
    sgtitle('Motor Thrust Forces vs Time')
    saveas(gcf, "Results/MotorForces.png")

    % 3D trajectory
    if flag
        figure()
        hold on;
        plot3(state(1, :), state(2, :), state(3, :))
        scatter3(state(1, 1), state(2, 1), state(3, 1), 'g', 'filled')
        scatter3(state(1, end), state(2, end), state(3, end), 'r', 'filled')
        hold off;
    end

end