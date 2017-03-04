function [names, rates] = loadRatesPerDevice(T)
names = unique(T{:,11});
rates = zeros(length(names), 1);
for i = 1:length(names)
    deviceTable = strcmp(names{i}, T{:,11});
    devicePurchases = T{deviceTable, 17};
    rates(i) = mean(devicePurchases);
end;