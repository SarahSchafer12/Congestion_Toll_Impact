#splits collsion data into pre/post toll implementation

BEGIN {
    FS="|"
}

{
    split($1,d,"/")
    month=d[1]+0
    day=d[2]+0
    year=d[3]+0 #splits date into parts

    if (year<2025 || (year==2025 && (month<1 || (month==1 && day<5)))) { #calculates pre 1/5/2025
        print $0
    }
}


