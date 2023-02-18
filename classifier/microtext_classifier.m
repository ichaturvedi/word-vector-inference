function [score1, score2] = microtext_classifier(filename, model, vocab)

fid = fopen(filename);
txt = textscan(fid,'%s','delimiter','\n');
load(model);
load(vocab);
sent = sentiment2(emb,mdl); 

for i=1:length(txt{1})

score1 = 0;
score2 = 0;
vec = randn(4,300);
try
[score1, vec, score2] = sent.scoreText(txt{1}{i});
catch
    1
end
dlmwrite('vec_test.txt',vec');
vectorinput;
load coeffsent.mat;
try
options = simset('SrcWorkspace','current');
sim('sdl_testbed',[],options);
catch
    0
end
load vecsentout.mat;
try
dlmwrite('vec_test2.txt',ans(2:5,1:300));
catch
    2
    dlmwrite('vec_test2.txt',vec);
end
score1 = 0;
score2 = 0;
vec = randn(4,300);
try
[score1, vec, score2] = sent.scoreText(txt{1}{i});
catch
    1
end
orig(i) = score1;
new(i) = score2;

end

score1 = orig';
score2 = new';

end