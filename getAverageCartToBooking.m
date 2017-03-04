function averageCartToBooking = getAverageCartToBooking(sessions)
bookedVector = sessions{:,17} == 1;
bookedAndCartVector = sessions{bookedVector, 5}; % Column 5 is the "added to cart" column
averageCartToBooking = mean(bookedAndCartVector);
end