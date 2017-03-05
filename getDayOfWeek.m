function dayOfWeek = getDayOfWeek(sessions)
dayValues = {zeros(height(sessions))};
for days = sessions{:,2}
    reday = datevec(days);
    DayNumber = datenum(reday);  
    dayValues{days} = DayNumber;
    
end
dayOfWeek = dayValues;
    
