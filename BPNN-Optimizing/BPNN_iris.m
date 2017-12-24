%读取训练数据
[f1,f2,f3,f4,class] = textread('iris.txt' , '%f%f%f%f%d','delimiter',',');

%特征值归�?��
 %input 3*150 matirx
[input,minI,maxI] = premnmx( [f1 , f2 , f3 , f4 ]');

%构�?输出矩阵
s = length( class) ;
output = zeros( s , 3 ) ;
for i = 1 : s 
   output( i , class( i ) ) = 1;
end

%创建神经网络
net = newff( minmax(input) , [10 3] , { 'logsig' 'purelin' } , 'traingdx' ) ; 

%设置训练参数
net.trainparam.show = 50 ;
net.trainparam.epochs = 500 ;
net.trainparam.goal = 0.01 ;
net.trainParam.lr = 0.01 ;

%�?��训练
net = train( net, input , output' ) ;

%读取测试数据
[t1 t2 t3 t4 c] = textread('iris.txt' , '%f%f%f%f%f','delimiter',',');

%测试数据归一�?
testInput = tramnmx ( [t1,t2,t3,t4]' , minI, maxI ) ;

%仿真
Y = sim( net , testInput ) 

%统计识别正确�?
[s1 , s2] = size( Y ) ;
hitNum = 0 ;
for i = 1 : s2
    [m , Index] = max( Y( : ,  i ) ) ;
    if( Index  == c(i)   ) 
        hitNum = hitNum + 1 ; 
    end
end
sprintf('识别率是 %3.3f%%',100 * hitNum / s2 )