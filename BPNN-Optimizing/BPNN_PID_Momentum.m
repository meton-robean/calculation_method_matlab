function BPNN_PID_Momentum()
%%参数初始�?
xite=0.50;
alfa=0.05; 
  %网络结构�?
IN=4; H=5; Out=3;
  %采样时间
ts=0.01;
  %初始化权重参数矩�?
% wi=0.50*rands(H,IN);
% wo=0.50*rands(Out,H);
wi=[-0.2025,-0.1009,-0.3347,-0.4598;
     0.1505, 0.3879, 0.3262,-0.2666;
     0.3914,-0.2435, 0.1557,-0.1389;
     0.3611, 0.4668, 0.0465, 0.1335;
     -0.2901,0.1192,-0.2487, 0.4861];
 
wo=[-0.2928	-0.0278	-0.0235	0.1352	-0.4650;
           0.2571	-0.3411	-0.3837	-0.4027	-0.4603;
           0.3863	0.3109	0.3757	0.4084	0.4886];
wi_init_save=wi;   wo_init_save=wo;   
wo_1=wo;  wo_2=wo; 
wi_1=wi;  wi_2=wi;
  %初始化PID控制器的相关信号
M=[10,1,10];
%M=[1.8300,0.6629,0.6088];
x=[0,0,0];
du_1=0;
u_1=0; u_2=0; u_3=0; u_4=0; u_5=0;u_6=0;u_7=0;
y_1=0; y_2=0; y_3=0; 
error_1=0; error_2=0;
  %隐含层神经元的输�?
Oh=zeros(H,1);
I=Oh;

  %根据传�?函数进行Z变换后求差分方程
sys=tf(400,[1,50,0]);
dsys=c2d(sys,ts,'z');
[num,den]=tfdata(dsys,'v');
%%�?��采样
for k=1:1:70 
    time(k)=k*ts;
    rin(k)=1.0; %系统输入
    yout(k)=-den(2)*y_1-den(3)*y_2+num(2)*u_1+num(3)*u_2;
    error(k)=rin(k)-yout(k); %误差
    X(1)=error(k)-error_1;
    X(2)=error(k);
    X(3)=error(k)-2*error_1+error_2;
    xii=[X(1),X(2),X(3),1];
    xi=xii/norm(xii);
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
    kp(k)=M(1)*K(1); ki(k)=M(2)*K(2); kd(k)=M(3)*K(3);
    Kpid=[kp(k),ki(k),kd(k)];
    du(k)=Kpid*epid;
    u(k)=u_1+du(k); %控制器输出量
    if u(k)>10
        u(k)=10;
    end
    if u(k)<-10
        u(k)=-10;
    end
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
    
    u_7=u_6;u_6=u_5;u_5=u_4; u_4=u_3;u_3=u_2;u_2=u_1;u_1=u(k);   
    y_2=y_1; y_1=yout(k); 
    error_2=error_1; error_1=error(k);

end

%%%作图    
% plot(time,yout,'b');
% hold on;
plot(time,error,'r');
xlabel('t/s');  ylabel('error');




