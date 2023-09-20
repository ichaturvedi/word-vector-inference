classdef sentiment_new < handle
    %SENTIMENT scores sentiment of words or text
    %   uses a word embedding and classifier trained on it to score
    %   sentiment of words or text
    
    properties
        emb                                         % word embedding
        mdl                                         % classifier
    end
    
    methods
        function obj = sentiment_new(emb,mdl)
            %SENTIMENT Construct an instance of this class
            obj.emb = emb;
            obj.mdl = mdl;
        end
        
        function [scores, vec] = scoreWords(obj,words,index)
            %SCOREWORDS scores sentiment of words
            vecb = word2vec(obj.emb,words);          % word vectors
            vecb = vecb(1+(index-1)*4:index*4,:); 

            vec = load('vec_test2.txt');
            vec = normalize(vec, 'range', [-1 1]);
            vec = vecb - 0.2*vec;

            if size(vec,2) ~= obj.emb.Dimension     % check num cols
                vec =  vec';                        % transpose as needed
            end
            
            [~,scores,~] = predict(obj.mdl,vec);    % get class probabilities
            scores = scores(:,2) - scores(:,1);     % positive scores - negative scores
        end
        
        function [score, vec] = scoreText(obj,text,index)
            %SCORETEXT scores sentiment of text
            tokens = split(lower(text));            % split text into tokens
            [scores, vec] = obj.scoreWords(tokens,index);        % get score for each token
            score = mean(scores,'omitnan');         % average scores
        end
    end
end

