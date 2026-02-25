#splits collsion data into in and out of congestion zone                                                     

BEGIN {
    FS = "|"
}
{      
    if ($5 != "" && $6 != "" ) {
       lat = $5 + 0
       long = $6 + 0
        
       if (!(lat>= 40.7000 && lat<= 40.7650) || !(long>= -74.0180 && long <= -73.9350))
           print $0 #filters using long and lat

    } else if (!($7 == "")){
        cord = $7
        gsub(/[(),]/, "", cord)
        split(cord,l,",")
    
        lat = l[1] + 0
        long = l[2] + 0
        if ( !(lat>= 40.7000 && lat<= 40.7650) && (long>= -74.0180 && long <= -73.9350))
           print $0 #filters using coordinates
	
    } else{ 
	street = ""
        if (toupper($8) ~/(STREET|ST)/)
            street = toupper($8)
        else if (toupper($9) ~/(STREET|ST)/)
            street = toupper($9)
        if (match(street, /([[:digit:]]+).*?(ST|STREET)/,s)){
	    street_num = s[1] + 0
	    if (!(street_num <60)){
		print $0 #filters using street numbers (above 60th)
            }
	}else{
	    print $0
	}
    }
}

