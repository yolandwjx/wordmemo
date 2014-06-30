function dist = calcEditDist(s1,s2)      
    global word;  
  
    if nargin == 1  
        s2 = word;  
    end  
          
    %% calculate the edit distance with DP  
    m = length(s1);  
    n = length(s2);  
  
    if m*n == 0  
        dist = Inf;  
        return;  
    end  
      
    table = zeros(m,n);  
  
    table(:,1) = 0:m-1;  
    table(1,:) = 0:n-1;  
      
    for i=2:m  
        for j=2:n  
            if s1(i-1)==s2(j-1)  
                table(i,j) = table(i-1,j-1);  
            else  
                table(i,j) = 1 + min([(min(table(i-1,j),table(i,j-1))),table(i-1,j-1)]);  
            end  
        end  
    end  
      
    %% set result  
    dist = table(m,n);  
    return;  
end  
