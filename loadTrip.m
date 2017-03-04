function T = loadTrip()
formatString = '%d%s%d%d%d%s%d%d%s%d%s%d%s%d%d%d%d';
T = readtable('datathon_tadata.csv', 'Delimiter',',','Format',formatString);
end