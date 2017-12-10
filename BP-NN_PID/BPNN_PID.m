
clear all;
close all;
%%参数初始�?
xite=0.20;
alfa=0.05; 
  %网络结构�?
IN=4; H=5; Out=3;
  %采样时间
ts=0.001;
  %初始化权重参数矩�?
% wi=0.50*rands(H,IN);
% wo=0.50*rands(Out,H);

wi=[0.1407 0.2400 -0.4138 0.2894;
         -0.1712 -0.2652 -0.1336 -0.1323;
         0.1538 0.2350 -0.1308 -0.2940;
         0.2491 0.4706 0.1850 -0.4133;
         0.0832 0.3669 0.0979 0.2719];

wo=[-0.2943 -0.2710 -0.3482 -0.2059 -0.4085;
          -0.1117 0.1419 0.2819 -0.2626 -0.0947;
          0.0518 -0.0155 -0.3994 0.0309 -0.3952];
wi_init_save=wi;   wo_init_save=wo;   
wo_1=wo;  wo_2=wo; 
wi_1=wi;  wi_2=wi;
  %初始化PID控制器的相关信号
x=[0,0,0];
du_1=0;
u_1=0;
y_1=0;
error_1=0; error_2=0;
  %隐含层神经元的输�?
Oh=zeros(H,1);
I=Oh;
  
%%�?��采样
for k=1:1:4000  
    time(k)=k*ts;
    rin(k)=sin(1*2*pi*k*ts); %系统输入
    a(k)=1.2*(1-0.8*exp(-0.1*k));  
    yout(k)=a(k)*sin(y_1)+1.2*u_1; %根据差分方程递推出输�?

    error(k)=rin(k)-yout(k); %误差
    %xi=[rin(k),yout(k),error(k),1]; %神经网络的输�?
    X(1)=error(k)-error_1;
    X(2)=error(k);
    X(3)=error(k)-2*error_1+error_2;
    xi=[X(1),X(2),X(3),1];
    epid=[X(1);X(2);X(3)];

    %%%前向信号传播----------------------------------------
    %%从输入层到隐�?
      %线�?变化
    net2=xi*(wi');
      %tanh�?��函数
    for j=1:1:H
        Oh(j)=( exp( net2(j)-exp(-net2(j)) ) )/(exp( net2(j)+exp(-net2(j)) ));
    end
    %%从隐层到输出
      %线�?变换
    net3=wo*Oh;
      %sigmoid�?��函数
    for l=1:1:Out
        K(l)=exp(net3(l))/(exp(net3(l))+exp(-net3(l)));
    end
    kp(k)=K(1); ki(k)=K(2); kd(k)=K(3);
    Kpid=[kp(k),ki(k),kd(k)];
    du(k)=Kpid*epid;
    u(k)=u_1+du(k); %控制器输出量

    %%%反向传播------------------------------------------------
    %%从输出层到隐层传�?
    dyu(k)=sign((yout(k)-y_1)/(du(k)-du_1+0.0001));
    for j=1:1:Out
        dK(j)=1/(exp(net3(j))+exp(-net3(j)));
    end
      %求局部梯度因�?
    for l=1:1:Out
        delta3(l)=error(k)*dyu(k)*epid(l)*dK(l);
    end

    for l=1:1:Out
        for i=1:1:H
            d_wo=xite*delta3(l)*Oh(i)+alfa*(wo_1-wo_2);
        end
    end
      %更新输出层到隐层的权值参数wo
    wo=wo_1+d_wo+alfa*(wo_1-wo_2);

    %%%从隐层到输入层的反向传播-------------------------------
    for i=1:1:H
        dO(i)=4/(exp(net2(i))+exp(-net2(i)))^2;
    end
    segma=delta3*wo;
    for i=1:1:H
        delta2(i)=dO(i)*segma(i);
    end
    d_wi=xite*delta2'*xi;
      %更新隐层到输入层的权值参数wi
    wi=wi_1+d_wi+alfa*(wi_1-wi_2);
      %保留前一时刻的权�?
    wo_2=wo_1; wo_1=wo;
    wi_2=wi_1; wi_1=wi;

    %%%控制器参数更新，时移赋�?
    du_1=du(k);
    u_1=u(k);
    y_1=yout(k);
    error_2=error_1; error_1=error(k);

end

%%%作图
figure(1);
plot(time,rin,'r');
xlabel('t/s');  ylabel('rin');
% hold on;
% plot(time,yout,'b');

figure(2);
plot(time,error,'r');
xlabel('t/s');  ylabel('error');

figure(3);
plot(time,u,'r');
xlabel('t/s');  ylabel('u');

figure(4);
subplot(311);
plot(time,kp,'r');
xlabel('t/s');  ylabel('kp');
subplot(312);
plot(time,ki,'g');
xlabel('t/s');  ylabel('ki');
subplot(313);
plot(time,kd,'b');
xlabel('t/s'); ylabel('kd');


figure(5);
plot(time,yout,'b');











