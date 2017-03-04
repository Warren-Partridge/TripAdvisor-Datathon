dataInput = loadForNNData(T)';
booked = double(T{:,17}');

nnet = patternnet([200 10 5 10 200], 'trainrp');
nnet.divideParam.trainRatio = 90/100;
nnet.divideParam.valRatio = 5/100;
nnet.divideParam.testRatio = 5/100;


[nnet,tr] = train(nnet,dataInput,booked);

outputs = nnet(dataInput);
performance = perform(nnet,booked,outputs);
view(nnet)
