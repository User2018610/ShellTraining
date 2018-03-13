BEGIN {print "user\t\t\tHOME"; print "---\t\t\t---"} 
{print $1 "\t\t\t" $6} 
END {print "=========finish============"}
