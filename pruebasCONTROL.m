%% SCRIPT DISEÑADO PARA PROBAR LOS CONTROLADORES
clc % Clean command window
% Definicion del tiempo de muestreo
Tm=0.001;

% Definicion de las reductoras (Comentar una de las dos)
R1=1; R2=1; R3=1;
%R1=50; R2=30; R3=15;

% Definicion del tiempo de simulacion
t_sim=5;

% Deficicion de los valores necesarios para el GDT
% EXPERIMENTO 1 Y 2
% XYZ_init=[1.8 ; 0 ; 1.2];
% XYZ_fin =[1.5071 ; 0 ; 0.4929];  % var articulares -> [0;-pi/4;pi/4]
%t_mov=3;

%EXPERIMENTO 3
%XYZ_init=[1.8 ; 0 ; 1.2];
%XYZ_fin=[0.9;0.9;1.0586];   % var articulares -> [pi/4;-pi/4;pi/2]
%t_mov=2;                    

% EXPERIMENTO 4
XYZ_init=[1.8;0;1.2];
%XYZ_init =[1.266 ; 0 ; 0.00718];    % var articulares -> [0;-pi/6;-pi/6]
XYZ_fin =[0.4;0.4;2.7657];      % var articulares -> [pi/4;pi/2;-pi/4]
n_ptos=5;                   % Numero de ptos empleado para la trayectoria
t_init_tray=2;              % Tiempo de inicio de la trayectoria
t_mov=1;                    % Duracion del movimiento

% Definicion de las variables articulares iniciales del robot
q1_init=0; q2_init=0; q3_init=0;
% IMPORTANTE -> MARCAR CASILLA EN EL ROBOT SI TRABAJAMOS SIN REDUCTORAS

% Se compila la computadora (Seria interesante poder pasarle el robot que
% se busca simular)
% Comentar uno de los modos de compilacion
mex('CFLAGS="\$CFLAGS -std=c99"', 'Computadora.c'); %LINUX
% mex Computadora.c   % WINDOWS

% Se lanza la simulacion
sim('sl_ControlRobotReal_RRR');

% Si todo ha ido bien, se grafican resultados
graficas_controladores(t_D,qr_D,qdi_D,qr,qdr,ref,xyz_D,Im_D);
