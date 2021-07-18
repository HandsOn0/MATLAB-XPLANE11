u=udp('127.0.0.1','LocalPort',49003);
fopen(u);
n=7;
A=fread(u,5+9*4*n);
for i=1:n
    for j=2:9
        Data(i,j-1)=typecast(uint8(A(6+(i-1)*36+(j-1)*4:6+(i-1)*36+(j-1)*4+3)),'single');
    end
end