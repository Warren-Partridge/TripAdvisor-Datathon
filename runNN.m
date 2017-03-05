dataInput = loadForNNData(sessions)';
booked = double(sessions{:,17}');

nnet = patternnet([500 40 500], 'trainrp');
% 500 40 500 makes it guess all 1 (and fail) :(


nnet.divideParam.trainRatio = 80/100;
nnet.divideParam.valRatio = 10/100;
nnet.divideParam.testRatio = 10/100;


[nnet,tr] = train(nnet,dataInput,booked);

outputs = nnet(dataInput);
performance = perform(nnet,booked,outputs);
view(nnet)
