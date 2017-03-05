function [names, rates] = loadRatesPerDevice(sessions)
names = unique(sessions{:,11});
rates = zeros(length(names), 1);
for i = 1:length(names)
    deviceTable = strcmp(names{i}, sessions{:,11});
    devicePurchases = sessions{deviceTable, 17};
    rates(i) = mean(devicePurchases);
end
end