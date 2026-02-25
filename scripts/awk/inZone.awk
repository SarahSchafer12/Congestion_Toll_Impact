#splits collsion data into in and out of congestion zone

BEGIN {
    FS = "|"
}
{
    if ($5 != "" && $6 != "" ) {
       lat = $5 + 0
       long = $6 + 0

       if ((lat>= 40.7000 && lat<= 40.7650) && (long>= -74.0180 && long <= -73.9350)){
           print $0 #filters by long and lat
       }   
    } else if (!($7 == "")){
        cord = $7
        gsub(/[(),]/, "", cord)
        split(cord,l,",")

        lat = l[1] + 0
        long = l[2] + 0
        if ((lat>= 40.7000 && lat<= 40.7650) && (long>= -74.0180 && long <= -73.9350))
           print $0 #filters by coordinate
    } else {
        street = ""
        if (toupper($8) ~/(STREET|ST)/)
            street = toupper($8)
        else if (toupper($9) ~/(STREET|ST)/)
            street = toupper($9)
        if (street != "") {
            if (match(street, /([[:digit:]]+).*?(STREET|ST)/, s)) {
                street_num = s[1] + 0
                if (street_num < 60)
                    print $0 #filters by street (below 60th)
	    }
	}
    }
}
