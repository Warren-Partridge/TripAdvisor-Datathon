%dataInput = loadForNNData(sessions)';
dataInput = csvread('excellent_data.csv')';
%disp(dataInput);
booked = double(sessions{:,17}');

nnet = patternnet([20], 'trainrp');
% 500 40 500 @ 90/5/5 makes it guess all 1 (and fail) :(

nnet.divideParam.trainRatio = 80/100;
nnet.divideParam.valRatio = 10/100;
nnet.divideParam.testRatio = 10/100;


[nnet,tr] = train(nnet,dataInput,booked);

outputs = nnet(dataInput);
performance = perform(nnet,booked,outputs);
view(nnet)
