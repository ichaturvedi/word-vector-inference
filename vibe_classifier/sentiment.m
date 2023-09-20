classdef sentiment < handle
    %SENTIMENT scores sentiment of words or text
    %   uses a word embedding and classifier trained on it to score
    %   sentiment of words or text
    
    properties
        emb                                         % word embedding
        mdl                                         % classifier
    end
    
    methods
        function obj = sentiment(emb,mdl)
            %SENTIMENT Construct an instance of this class
            obj.emb = emb;
            obj.mdl = mdl;
        end
        
        function [scores, vec] = scoreWords(obj,words)
            %SCOREWORDS scores sentiment of words
            vec = word2vec(obj.emb,words);          % word vectors
            if size(vec,2) ~= obj.emb.Dimension     % check num cols
                vec =  vec';                        % transpose as needed
            end
            [~,scores,~] = predict(obj.mdl,vec);    % get class probabilities
            scores = scores(:,2) - scores(:,1);     % positive scores - negative scores
        end
        
        function [score, vec] = scoreText(obj,text)
            %SCORETEXT scores sentiment of text
            tokens = split(lower(text));            % split text into tokens
            [scores, vec] = obj.scoreWords(tokens);        % get score for each token
            score = mean(scores,'omitnan');         % average scores
        end
    end
end

