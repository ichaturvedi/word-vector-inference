function [score1, score2] = classifier_microtext(filename, model, vocab)

fid = fopen(filename);
txt = textscan(fid,'%s','delimiter','\n');
load(model);
load(vocab);
sent = sentiment(emb,mdl);
sent_new = sentiment_new(emb,mdl);
load coeffsent.mat;

for i=1:length(txt{1})

  score1 = 0;
  try
    [score1, vec] = sent.scoreText(txt{1}{i});
  catch
     1
  end
  
  dlmwrite('vec_test.txt',vec');
  vecfile = sprintf('old_vectors/%d.txt',i);
  copyfile('vec_test.txt',vecfile);
  
  % remove last few blanks
  vec = vec(1:end-2,:);


  % chunk sentence into words  
  nochunk = size(vec,1)/4;
  chunk = [];
  for j=1:nochunk
  
    try
      vectorinput(j);
    catch
      2
    end

    try
      options = simset('SrcWorkspace','current');
      sim('sdl_testbed',[],options);
    catch
       3
    end

    load vecsentout.mat;
  
    try
      dlmwrite('vec_test2.txt',ans(2:5,1:300));
    catch
      4
      dlmwrite('vec_test2.txt',vec);
    end

    vecfile = sprintf('new_vectors/%d_%d.txt',i,j);
    copyfile('vec_test2.txt',vecfile);

    score2 = 0;
    try
      [score2] = sent_new.scoreText(txt{1}{i},j);
      chunk(j) = score2;
    catch
      5
      chunk(j) = -1;
    end
  end

  orig(i) = score1;
  new(i) = mean(chunk);

  if rem(i,100) == 0 || i == size(txt{1},1) 
       dlmwrite('score1.txt',orig);
       dlmwrite('score2.txt',new);
  end
  
end

end
