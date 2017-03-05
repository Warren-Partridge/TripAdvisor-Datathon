function averageActivity = getAverageActivity(sessions)
activeVector = sessions{:,4} > 0; %If the score is 0, they're inactive.
activeAndDuration = sessions{activeVector, 7};
averageActivity = mean(activeAndDuration);
end

