# Sentiment classification of Micro-text


Requirements
---
This code is based on the Text classifier code found at:
https://blogs.mathworks.com/loren/2017/09/21/math-with-words-word-embeddings-with-matlab-and-text-analytics-toolbox/

Preprocessing
---

We run the script to extract co-efficients in folder 'parameters' as follows:

perl getemotionaffect.pl affectivespace.csv senticnet.csv
- Download 'affectivespace.csv' and 'senticnet.csv' from http://sentic.net/downloads/
- The output is affectivespace for different emotions such as 'happy.csv'

[sent_stiffness, sent_curvature, sent_mode, sent_variance] = sent_parameters(filename)
