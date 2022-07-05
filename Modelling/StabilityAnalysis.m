% Peyton Early, Tyler Kirkpatrick
% Drone Array Project
% StabilityAnalysis.m
% Created: 06/15/2022
% Updated: 06/15/2022

%% Cleaning
close all; clear all; clc;

%% Aircraft constants
m  = nan;  % [kg] Mass
R  = nan;  % [m] Radial distance from cg to propeller
km = nan;  % [N*m/N] Control moment coefficient
Ix = nan;  % [kg*m^2] Body x-axis moment of inertia
Iy = nan;  % [kg*m^2] Body y-axis moment of inertia
Iz = nan;  % [kg*m^2] Body z-axis moment of inertia
nu = nan;  % [N/(m/s)^2)] Aerodynamic moment coefficient
mu = nan;  % [N*m/(rad/s)^2] Aerodynamic moment coefficient
k  = nan;  % [N*m/(rad/s)] Control moment gain
g  = 9.81; % [m/s^2] Gravitational acceleration
Zc = -m*g; % [N] Scalar Z control force

%% Response to perturbations