function longSessions = getLongSessions(sessions, seconds)
longSessions = sessions(sessions{:,7} < seconds);
end