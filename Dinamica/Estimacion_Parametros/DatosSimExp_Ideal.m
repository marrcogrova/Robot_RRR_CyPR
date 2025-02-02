% %% ROBOT IDEAL CON REDUCTORAS %%%%%%%%%%%%%%%%%%%%%%%%%%
% Vector de  combinacion de parametros dinamicos a estimar
%     m1*s11z^2 + m2*s22x^2 + m3*s33x^2 + I11yy + I22yy + I33yy + 2500*Jm1 - m2 - 1.6*m3     1 -> INERCIALES
%                       							     Bm1     2 -> VISCOSIDAD
%      						   - m2*s22x^2 + I22xx - I22yy + m2 + m3     3 -> INERCIAS
%                     				 m2*s22x^2 + I22zz + 900.0*Jm2 - m2 - m3     4 -> INERCIAL
%                                      						     Bm2     5 -> VISCOSIDAD
%                              			   - m3*s33x^2 + I33xx - I33yy + 0.64*m3     6  -> INERCIAL
%                                                	     m3*s33x^2 + I33zz - 0.64*m3     7 -> INERCIAL
%                                                  				     Jm3     8 -> INERCIAL
%                                      						     Bm3     9 -> VISCOSIDAD
%                                          			     - m2 - m3 + m2*s22x    10 -> GRAVITACIONAL (?)
%                                                                        m3*s33x - 0.8*m3    11 -> GRAVITACIONAL (?)
% %%
POS INICIAL = 0,0,0;

%% PARAMETROS SENOS

% Valores de tiempo atenuacion
tau1=5; tau2=5; tau3=5;

% %%%% Parametros senoides %%%%
% Senoide I1
Aa_1=4; Ab_1=2;
wa_1=50; wb_1=1;
Im_cc1=0;

% Senoide I2
Aa_2=1; Ab_2=1;
wa_2=5; wb_2=10;
Im_cc2=2;

% Senoide I3
Aa_3=.5; Ab_3=.1;
wa_3=3; wb_3=10;
Im_cc3=1;

%% VALORES ESTIMADOS

%tetha_li(1)= 1.563217e+01 Valido con varianza 3.377704e-02 
%tetha_li(2)= 1.200064e-03 Valido con varianza 2.180869e-02 
%tetha_li(3)= 7.389009e+00 Valido con varianza 4.809091e-02 
%tetha_li(4)= 5.511390e+01 Valido con varianza 8.094139e-04 
%tetha_li(5)= 8.504246e-04 Valido con varianza 2.743602e-02 
%tetha_li(6)= 2.084184e+00 Valido con varianza 4.786803e-02 
%tetha_li(7)= -2.041468e+00 Valido con varianza 6.237249e-03 
%tetha_li(8)= 5.074000e-02 Valido con varianza 1.135601e-03 
%tetha_li(9)= 1.499010e-03 Valido con varianza 3.271395e-02 
%tetha_li(10)= -6.665522e+00 Valido con varianza 5.383873e-04 
%tetha_li(11)= -2.221688e+00 Valido con varianza 1.126687e-03 

%% MATRICES OBTENIDAS
 
Ma =
 
[ 0.088868*L3 - 0.14778*cos(2.0*q2) - 0.041684*cos(2.0*q2 + 2.0*q3) + 0.088868*L2*cos(q3) + 0.088868*L3*cos(2.0*q2 + 2.0*q3) + 0.26662*L2*(cos(2.0*q2) + 1.0) + 0.088868*L2*cos(2.0*q2 + q3) + 0.81475,                                                    0,                                         0]
[                                                                                                                                                                                                    0, 1.1109*L2 + 0.37028*L3 + 0.37028*L2*cos(q3) + 4.4227, 0.37028*L3 + 0.18514*L2*cos(q3) - 0.17012]
[                                                                                                                                                                                                    0,            0.84636*L3 + 0.42318*L2*cos(q3) - 0.38885,     0.0096648*R3^2 + 0.84636*L3 - 0.38885]
 
 
Va =
 
 -8.6736e-21*qd1*(- 5.5343e15*R1^2 - 3.4076e19*qd2*sin(2.0*q2) - 9.6116e18*qd2*sin(2.0*q2 + 2.0*q3) - 9.6116e18*qd3*sin(2.0*q2 + 2.0*q3) + 1.0246e19*L2*qd3*sin(q3) + 2.0491e19*L3*qd2*sin(2.0*q2 + 2.0*q3) + 2.0491e19*L3*qd3*sin(2.0*q2 + 2.0*q3) + 2.0491e19*L2*qd2*sin(2.0*q2 + q3) + 1.0246e19*L2*qd3*sin(2.0*q2 + q3) + 6.1479e19*L2*qd2*sin(2.0*q2))
                                                                                                  0.000070869*R2^2*qd2 - 0.086841*qd1^2*sin(2.0*q2 + 2.0*q3) - 0.30788*qd1^2*sin(2.0*q2) + 0.55546*L2*qd1^2*sin(2.0*q2) - 0.18514*L2*qd3^2*sin(q3) + 0.18514*L3*qd1^2*sin(2.0*q2 + 2.0*q3) + 0.18514*L2*qd1^2*sin(2.0*q2 + q3) - 0.37028*L2*qd2*qd3*sin(q3)
                                                                                                                                                                 0.00028553*R3^2*qd3 - 0.19849*qd1^2*sin(2.0*q2 + 2.0*q3) + 0.21159*L2*qd1^2*sin(q3) + 0.42318*L2*qd2^2*sin(q3) + 0.42318*L3*qd1^2*sin(2.0*q2 + 2.0*q3) + 0.21159*L2*qd1^2*sin(2.0*q2 + q3)
 
 
Ga =
 
                                                 0
 0.083333*g*(2.2217*cos(q2 + q3) + 6.6655*cos(q2))
                            0.42318*g*cos(q2 + q3)
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ROBOT IDEAL SIN REDUCTORAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
(SE HA BAJADO EL LIMITE A UN 6% DE DESVIACION TIPICA) 
POS INICIAL = 0,-pi/4,0;

%%%%%%%%%%%%%%%%%%%%%% TETHA LINEALMENTE INDEPENDIENTE %%% 
                                        m1*s11z^2 + m2*s22x^2 + m3*s33x^2 + I11yy + I22yy + I33yy + Jm1 - 1.0*m2 - 1.64*m3
 - 1.1102e-16*m2*s22x^2 - 5.5511e-17*m3*s33x^2 + Bm1 - 1.1102e-16*I22yy - 5.5511e-17*I33yy + 1.1102e-16*m2 + 2.2204e-16*m3
                                                      - 1.0*m2*s22x^2 + 5.8582e-17*m3*s33x^2 + I22xx - 1.0*I22yy + m2 + m3
                                       m2*s22x^2 - 3.8969e-16*m3*s33x^2 + I22zz - 1.3878e-17*I33yy + Jm2 - 1.0*m2 - 1.0*m3
                    - 1.1122e-16*m2*s22x^2 + 2.0741e-17*m3*s33x^2 + Bm2 - 1.3878e-17*I33yy - 1.7764e-15*m2 + 1.0547e-14*m3
                                                                             - 1.0*m3*s33x^2 + I33xx - 1.0*I33yy + 0.64*m3
                                                        7.3962e-17*m2*s22x^2 + m3*s33x^2 + I33zz + 8.8818e-16*m2 - 0.64*m3
                                                       - 2.4847e-16*m2*s22x^2 + 2.2327e-16*m3*s33x^2 + Jm3 - 7.1054e-15*m3
                                                         1.3263e-16*m2*s22x^2 + 8.0024e-17*m3*s33x^2 + Bm3 + 3.5527e-15*m3
                                                                        - 2.9291e-17*m3*s33x^2 - 1.0*m2 - 1.0*m3 + m2*s22x
                                                                                                          m3*s33x - 0.8*m3

% Valores de tiempo atenuacion
tau1=5; tau2=5; tau3=5;

% %%%% Parametros senoides %%%%
% Senoide I1
Aa_1=10; Ab_1=20;
wa_1=50; wb_1=1;
Im_cc1=0;

% Senoide I2
Aa_2=20; Ab_2=5;
wa_2=5; wb_2=10;
Im_cc2=10;

% Senoide I3
Aa_3=5; Ab_3=1;
wa_3=10; wb_3=3;
Im_cc3=8;


%%%%%%%%%%%%%%%%%%%%%% TETHA LINEALMENTE INDEPENDIENTE ESTIMADA %%% 
tetha_li(1)= -9.314765e+00 Valido con varianza 3.645039e-03 
tetha_li(2)= 1.193912e-03 Valido con varianza 2.868001e+00 
tetha_li(3)= 7.380304e+00 Valido con varianza 3.680273e-03 
tetha_li(4)= -7.234084e+00 Valido con varianza 3.692238e-03 
tetha_li(5)= 1.214007e-03 Valido con varianza 5.890269e+00 
tetha_li(6)= 2.078458e+00 Valido con varianza 3.582345e-03 
tetha_li(7)= -2.033541e+00 Valido con varianza 3.592809e-03 
tetha_li(8)= 5.063999e-02 Valido con varianza 1.483466e-02 
tetha_li(9)= 1.464027e-03 Valido con varianza 2.189983e+00 
tetha_li(10)= -6.658589e+00 Valido con varianza 3.620952e-03 
tetha_li(11)= -2.217005e+00 Valido con varianza 3.562410e-03 


%%%%%%%%%%%%%%%%% MATRICES DEL MODELO DEL ROBOT %%%%%%%%%%%%%%%%%% 
Ma =
 
[ 4.434*L3 - 7.3803*cos(2.0*q2) - 2.0785*cos(2.0*q2 + 2.0*q3) + 4.434*L2*cos(q3) + 4.434*L3*cos(2.0*q2 + 2.0*q3) + 13.317*L2*(cos(2.0*q2) + 1.0) + 4.434*L2*cos(2.0*q2 + q3) - 9.1708,                                                  0,                                      0]
[                                                                                                                                                                                   0, 33.293*L2 + 11.085*L3 + 11.085*L2*cos(q3) - 23.169, 11.085*L3 + 5.5425*L2*cos(q3) - 5.0839]
[                                                                                                                                                                                   0,             12.669*L3 + 6.3343*L2*cos(q3) - 5.8101,                     12.669*L3 - 5.6654]
 
 
Va =
 
 -1.7347e-18*qd1*(2.556e18*L2*qd3*sin(q3) - 2.3963e18*qd2*sin(2.0*q2 + 2.0*q3) - 2.3963e18*qd3*sin(2.0*q2 + 2.0*q3) - 8.5089e18*qd2*sin(2.0*q2) + 5.1121e18*L3*qd2*sin(2.0*q2 + 2.0*q3) + 5.1121e18*L3*qd3*sin(2.0*q2 + 2.0*q3) + 5.1121e18*L2*qd2*sin(2.0*q2 + q3) + 2.556e18*L2*qd3*sin(2.0*q2 + q3) + 1.5354e19*L2*qd2*sin(2.0*q2) - 1.3765e15)
                                                                                                         0.003035*qd2 - 2.5981*qd1^2*sin(2.0*q2 + 2.0*q3) - 9.2254*qd1^2*sin(2.0*q2) + 16.646*L2*qd1^2*sin(2.0*q2) - 5.5425*L2*qd3^2*sin(q3) + 5.5425*L3*qd1^2*sin(2.0*q2 + 2.0*q3) + 5.5425*L2*qd1^2*sin(2.0*q2 + q3) - 11.085*L2*qd2*qd3*sin(q3)
                                                                                                                                                                   0.0041829*qd3 - 2.9692*qd1^2*sin(2.0*q2 + 2.0*q3) + 3.1671*L2*qd1^2*sin(q3) + 6.3343*L2*qd2^2*sin(q3) + 6.3343*L3*qd1^2*sin(2.0*q2 + 2.0*q3) + 3.1671*L2*qd1^2*sin(2.0*q2 + q3)
 
 
Ga =
 
                                           0
 2.5*g*(2.217*cos(q2 + q3) + 6.6586*cos(q2))
                       6.3343*g*cos(q2 + q3)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
