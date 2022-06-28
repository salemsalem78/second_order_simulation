global Data;
global UpdateTimer;

Data.time_step_size = 0.05;
Data.time = -9:Data.time_step_size:1;
Data.x = zeros(size(Data.time));
Data.y = zeros(size(Data.time));
Data.K = 1;
Data.zeta = 1;
Data.omega = 1;
Data.N = length(Data.time);
Data.Running = 0;
Data.ypp = 0;
Data.yp = 0;

plot(Data.time,Data.x,'g--',Data.time(1:Data.N),Data.y(1:Data.N),'b-','linewidth',2);
axis([Data.time(1) Data.time(end)+1 -2 5]);
UpdateTimer = timer('BusyMode','queue','ExecutionMode','fixedDelay','Name','UpdateTimer',...
    'Period',0.1,'TimerFcn','UpdateData');