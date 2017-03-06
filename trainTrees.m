if(exist('dataInput', 'var') ~= 1)
dataInput = csvread('excellent_data.csv')';
end
if(exist('booked', 'var') ~= 1)
    load('booked.mat');
    booked = booked{:};
    endv

N = length(dataInput);
r = randperm(N);
tempData = dataInput(:,r);
bookedPerm = booked(r);
numTrees = 5000;
trainSize = 70/100;
testSize = 1 - trainSize;
trainData = tempData(:,1:(N*trainSize))';
trainLabels = bookedPerm(1:(N*trainSize));
testData = dataInput(:,(N*trainSize + 1):end);
testLabels = bookedPerm((N*trainSize + 1):end)';

%% Train the data
treeTrain = fitcensemble(trainData, trainLabels, 'NumLearningCycles', numTrees);

%% Test the fit:
predicitions = treeTrain.predict(testData');

confusionMatrix = scoreConfusion(predicitions, testLabels);