function Y = loadForNNData(T)
    asIsIndexes = [3,4, 5, 7, 8, 12, 14, 15, 16];
    namesTraffic = unique(T{:, 6});
    namesOS = unique(T{:,11});
    Y = zeros(height(T), length(asIsIndexes) + length(namesTraffic) + length(namesOS));
    Y(:,1:length(asIsIndexes)) = T{:,asIsIndexes};
    
    M = length(asIsIndexes);
    trafficlabels = zeros(height(T), length(namesTraffic));
    for i = 1:length(namesTraffic)
       trafficlabels(strcmp(T{:,6},namesTraffic(i)), i) = 1;
    end
    Y(:,(M + 1):(M + length(namesTraffic))) = trafficlabels;
 
    M = M + length(namesTraffic);
    oslabels = zeros(height(T), length(namesOS));
    for i = 1:length(namesTraffic)
       oslabels(strcmp(T{:,6},namesTraffic(i)), i) = 1;
    end
    Y(:,(M + 1):(M + length(namesOS))) = oslabels; 
end