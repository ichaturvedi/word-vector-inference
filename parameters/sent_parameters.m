function [sent_stiffness, sent_curvature, sent_mode, sent_variance] = sent_parameters(filename)

happy = load(filename);
X = happy(:,1:2);
X = happy(:,1:2);
Y = happy(:,3:4);
Z = happy(:,5:6);
[K,H,Pmax,Pmin] = surfature(X,Y,Z);
H(isnan(H))=0;
sent_mode = max(max(happy));
sent_variance = std(std(happy));
Hn = normalize(H, 'range', [0 1]);
sent_curvature = mean(mean(Hn));
sent_stiffness = max(max(happy))-min(min(happy));

end