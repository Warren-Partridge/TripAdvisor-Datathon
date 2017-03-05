function dayOfWeek = getDayOfWeek(sessions)
dayValues = zeros(height(sessions), 1);

for days = 1:length(sessions{:,2})
    reday = datevec(sessions{days,2}); %where it expands into vector
    %DayNumber = datenum(reday);  %where it comes together as a numerical representation
    dayValues(days) = datenum(reday); % PROBLEM CHILD'
    
    % this is gonna take 83.33 minutes
    % hold onto your butts i'm gonna make a gr8 csv file in an hour and
    % a half
end
dayOfWeek = dayValues;