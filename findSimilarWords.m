function findSimilarWords(wordToMatch)  
    global word;  
    word = wordToMatch;  
    distThresh = 3;  
    
    %% calculate edit distance  
    [data,wordList]=xlsread('word.xls','sheet1','A1:B5969');
    indexList= wordList(:,1);
    
    editDist = cellfun(@calcEditDist,indexList);  
    
    for i=1:length(editDist)
        if editDist(i)<distThresh && editDist(i)>0
            disp(wordList{i,1});
            disp(wordList{i,2});
        end
    end
    
    
end  
