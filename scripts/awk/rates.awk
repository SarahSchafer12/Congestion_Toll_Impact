#calculate the rates of accidents for 2024 and 2025 using collsion data and entry data

BEGIN{
    FS = "|"
    OFS = "|"
}
{
    if (ARGIND == 1) {
        # post toll avg entries
        post_entries[$1] = $2
    } 
    else if (ARGIND == 2) {
        # post toll avg collisions
        post_coll[$1] = $2
    } 
    else if (ARGIND == 3) {
        # pre toll avg entries
        pre_entries[$1] = $2
    } 
    else if (ARGIND == 4) {
        # pre toll avg collisions
        pre_coll[$1] = $2
    }
}

END{
    for (m=1; m<=10; m++) { #only january through october bc data was uploaded mid november
	if (pre_entries[m] > 0)
	    pre_rate = (pre_coll[m] / pre_entries[m]) *100000 #scales to 100,000 so numbers are meaningful
	else
	    pre_rate = 0

	if (post_entries[m] > 0)
	    post_rate = (post_coll[m] / post_entries[m]) *100000
	else
	    post_rate = 0

	print  m, pre_rate, post_rate
    }
}
