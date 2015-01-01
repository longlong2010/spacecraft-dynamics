clear all;
close all;
clc;

xbar = 1210;
ybar = 700;

l = [0; 500; 1000];
z = [30.1; 45.0; 73.6];
r = [0.01; 0.01; 0.04];

estimate(xbar, ybar, l, z, r);
