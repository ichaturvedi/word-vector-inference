# Sentiment classification of Micro-text
This code implements the model discussed in the paper on modeling sentiment classification of micro-texts that contain a different sequnce of characters compared to the original text. For example 'tonight' is abbreviated as '2nite'. Such words are not a part of the vocabulary and hence word vectors have to be inferred from neighbours such as a bi-gram or tri-gram model. In this paper, we make use of the curvature of manifolds to transform word vectors based on intensity of emotions. 

Requirements
---
This code is based on the Text classifier code found at:
https://blogs.mathworks.com/loren/2017/09/21/math-with-words-word-embeddings-with-matlab-and-text-analytics-toolbox/

- The pretrained model for positive, negative and neutral is saved as 'sent_model.mat'
- The vocabulary for English language is saved as 'vocab.mat'

Micro-text
---
<img width="391" alt="micro" src="https://user-images.githubusercontent.com/65399216/219829913-c73be03f-8e51-405a-84e1-c2a5f44efd22.png">

- Word vectors represent each word in Affectivespace with angle &theta;
- We look at the difference in angles between consecutive words

Preprocessing
---

We run the script to extract co-efficients in folder 'parameters' as follows:

perl getemotionaffect.pl affectivespace.csv senticnet.csv
- Download 'affectivespace.csv' and 'senticnet.csv' from http://sentic.net/downloads/
- The output is affectivespace for different emotions such as 'happy.csv'

[sent_stiffness, sent_curvature, sent_mode, sent_variance] = sent_parameters(filename)
- filename is the emotion file such as 'happy.csv'
- update coeffsent.mat with parameters for each emotion

Microtext Classification
---

We run the script to classify microtext in folder 'vibe_classifier' as follows:

[score1, score2] = classifier_microtext('tweets_sub.txt','sent_model.mat','vocab.mat')
- The tweets containing microtext are in file 'tweets_sub.txt'
- The output 'score1' are the predicted labels without imputing word vectors
- The output 'score2' are the predicted labels after using word vector imputation

[fmeaavg, accavg] = sentfmea3(score2, 'labels.txt')
- The manually annotated labels are in 'labels.txt'
- The average three class fmeasure and accuracy are outputs

Paper link : https://onlinelibrary.wiley.com/doi/10.1111/exsy.13589
