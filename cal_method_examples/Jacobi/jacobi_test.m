% 3-1-1
%     A=[ 5 ,2, 1;-1,4,2;2,-3,10]
%     B=[-12,20,3]'
%     P=[1,2,2]' 
%     X= jacobi(A,B,P,1.0e-7,100 )  
    
    
%3-1-2
    A=[   5.0, 1.5, 1.3,  0.9,  0.0;  
             1.5,  4.5, 1.4,  1.0,  0.5 ;
             1.3,  1.4,  5.5, 1.5,  0.7;
             0.9,  1.0,  1.5,  5.5, 1.2;
             0.0,  0.5,  0.7,  1.2, 2.5  ]
    B=[21.1,21.9,23.1,26.4,10]'
    P=[1,2,3,4,5]' 
    X= jacobi(A,B,P,1.0e-7,100 )



%��:
%3-1-1
% X =
%    -4.0000
%     3.0000
%     2.0000

%3-1-2
% X =
%    2.371194387957542
%    2.623920775603516
%    1.945004333514387
%     3.088498615075897
%    1.448137197805833

