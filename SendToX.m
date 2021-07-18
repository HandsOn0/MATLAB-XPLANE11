throttle1=1;
throttle2=1;
No_command=single(-999);
header=uint8([68 65 84 65 0]);
throttle_cmd_index=uint8([25 0 0 0]);
primary_ctr_index=uint8([11 0 0 0]);
throttle_cmd=[throttle1 throttle2 No_command No_command No_command No_command No_command No_command];
primary_ctr_cmd=[10 15 20 No_command 60 No_command No_command No_command];
datagram=serialize(header,throttle_cmd_index,throttle_cmd,primary_ctr_index,primary_ctr_cmd);

u=udp('127.0.0.1',49000);
fopen(u);
fwrite(u,datagram);
function output=serialize(varargin)
[dummy n]=size(varargin);
id=1;
for i=1:n
w=typecast(varargin{i},'uint8');
[x y]=size(w);
output(id:id+y-1)=w;
id=id+y;
end
end