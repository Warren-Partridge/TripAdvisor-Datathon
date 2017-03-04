function sessions = loadSessions()
formatString = '%d%s%d%d%d%s%d%d%s%d%s%d%s%d%d%d%d';
sessions = readtable('datathon_tadata.csv', 'Delimiter',',','Format',formatString);
end