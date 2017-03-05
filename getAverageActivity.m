function averageActivity = getAverageActivity(sessions)
activeVector = sessions{:,4} > 0;
activeAndDuration = sessions{activeVector, 7};
averageActivity = mean(activeAndDuration);
end

