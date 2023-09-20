function vectorinput(index)

data = importdata('vec_test.txt');

%ir=randi(size(data,1),size(data,1),1); % since y is 1D; otherwise use size(y,1)
%datas = data(ir,:);
%datax = datas(:,1:4);

while size(data,2)<4
   data = [data data(:,end)]; 
end

datax = data(:,1+(index-1)*4:index*4);
datax = normalize(datax, 'range', [0 2]);

load('samplevec.mat');
tyre(2:5,1:300) = datax(1:300,:)';
tyre = tyre(:,1:300);

tyre = [tyre tyre];
tyre = tyre(:,1:359);

save vecsent.mat -v7.3 'tyre';

end
