#uses post toll, in zone, collision data to calculate avg amount of daily collisions per month in the congestion zone post toll implementation

BEGIN{
    FS = "|"
}
{   
    split($1,d,"/")
    month = d[1] + 0
    date = d[2]
    year = d[3]

    total[month] += 1 #each line is 1 collision
}
END{
    OFS = "|"
    for (i =1; i<=12; i++){ #calculates total per month and divides by amt of days
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
