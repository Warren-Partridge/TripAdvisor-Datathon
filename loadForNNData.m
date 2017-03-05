function Y = loadForNNData(sessions)
    asIsIndexes = [3,4, 5, 7, 8, 12, 14, 15, 16];
    namesTraffic = unique(sessions{:, 6});
    namesOS = unique(sessions{:,11});
    checkInLogical = ~strcmp(sessions{:,9}, 'NA');
    checkInIntInput = sessions{:,9};
    checkInIntOutput = zeros(height(sessions), 1);
    datesVector = getDayOfWeek(sessions); % this takes 83 minutes and returns vector of ints
    
    Y = zeros(height(sessions), length(asIsIndexes) + length(namesTraffic) + length(namesOS) + 2);
    Y(:,1:length(asIsIndexes)) = sessions{:,asIsIndexes};
    
    M = length(asIsIndexes);
    trafficlabels = zeros(height(sessions), length(namesTraffic));
    for i = 1:length(namesTraffic)
       trafficlabels(strcmp(sessions{:,6},namesTraffic(i)), i) = 1;
    end
    Y(:,(M + 1):(M + length(namesTraffic))) = trafficlabels;
 
    M = M + length(namesTraffic);
    oslabels = zeros(height(sessions), length(namesOS));
    for i = 1:length(namesTraffic)
       oslabels(strcmp(sessions{:,6},namesTraffic(i)), i) = 1;
    end
    Y(:,(M + 1):(M + length(namesOS))) = oslabels;
    
    for i = 1:length(checkInIntInput)
        if(strcmp(checkInIntInput(i), 'NA') == 1)
            checkInIntOutput(i) = 0;
        else
            checkInIntOutput(i) = str2double(checkInIntInput(i));
        end
    end
    
    %disp(sum(checkInIntOutput)/sum(checkInLogical));
    %disp(mean(checkInIntOutput(checkInLogical))); % This is the mean of checkInIntOutput without the 0s

    checkInIntOutput(~checkInLogical) = mean(checkInIntOutput(checkInLogical));
    
    M = M + length(namesOS);
    Y(:,(M + 1)) = checkInLogical;
    M = M + 1;
    Y(:,(M + 1)) = checkInIntOutput;
    
    M = M + 1;
    Y(:,(M + 1)) = datesVector;
    csvwrite('excellent_data.csv', Y);
end