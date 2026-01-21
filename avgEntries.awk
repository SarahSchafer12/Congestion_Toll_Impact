#uses toll data to calculate avg vehicle entires per day per month

BEGIN{
    FS = "|"
}
{
    split($1,d,"/")
    month = d[1] + 0
    date = d[2]
    year = d[3]

    total[month] += $13 + $14  #adds CRZ (congestion releif zone) entries and excluded roadway trips
}
END{
    OFS = "|"
    for (i =1; i<=12; i++){ #calculates the average, total of each month/ amount of days
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
    for (a in avg){
	print a,avg[a]
    }
}
