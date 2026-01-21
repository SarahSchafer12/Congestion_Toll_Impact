#uses pre toll, in congestion zone collsion data to calculate avg amount of daily collisions per month in the congestion zone pre toll implementation
#filters for only 2024 data to use that as control group, but the commented out would be if all years were used

BEGIN{
    FS = "|"
}
{
    split($1,d,"/")
    month = d[1] + 0
    year = d[3] + 0
    #years_seen[year]++
    
    if (year != 2024) #filters for 2024
	next
    total[month]++
}
END{
    OFS = "|"
    for (i =1; i<=12; i++){ #calculated per month
        if (i == 2){
            avg[i] = total[i]/28
        }
        else if (i == 4 || i == 6 || i ==9 || i ==11){
            avg[i] = total[i]/30
        }
        else{
            avg[i] = total[i]/31
        }
    }
    #for (y in years_seen)
    #count ++
    
    for (a in avg){
        print a,avg[a] #/count
    }
}
