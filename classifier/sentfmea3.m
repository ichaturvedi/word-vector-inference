% Positive: 1, Negative: 2, Neutral: 3

function [fmeaavg, accavg] = sentfmea3(score2, labels)

pred = score2;
label = load(labels);
cnt = 1;
for i = 1:size(label,1)

    T1(i) = label(i);

    if pred(i)>=0.3
        T2(i) = 1;
    elseif pred(i) >=0.1
        T2(i) = 3;
    else
        T2(i) = 2;
    end

end

cm2 = confusionmat(T1,T2);
nclass = 3;

% Calculate F-measure
for x=1:nclass

tp = cm2(x,x);
tn = cm2(1,1);
for y=2:nclass
tn = tn+cm2(y,y);
end
tn = tn-cm2(x,x);

fp = sum(cm2(:, x))-cm2(x, x);
fn = sum(cm2(x, :), 2)-cm2(x, x);
pre(x)=tp/(tp+fp+0.01);
rec(x)=tp/(tp+fn+0.01);
fmea(x) = 2*pre(x)*rec(x)/(pre(x)+rec(x)+0.01);
acc1(x) = (tp + tn)/(tp + fp + fn + tn);

fmeaavg = mean(fmea);
accavg = mean(acc1);

end