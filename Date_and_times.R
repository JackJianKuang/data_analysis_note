## Dates are represented by the 'Date' class and times are represented by the 'POSIXct' and 'POSIXlt' classes.
### Internally, dates are stored as the number of days since 1970-01-01 and times are stored as either the number of seconds since 1970-01-01 (for 'POSIXct') or a list of seconds, minutes, hours, etc. (for 'POSIXlt').

# ------------------------------- Date ---------------------------------------
d1 <- Sys.Date() # get the current date
class(d1)
# [1] "Date"
unclass(d1)
# [1] 16755 # That's the exact number of days since 1970-01-01!
d2 <- as.Date("1969-01-01")
unclass(d2)
# [1] -365

# --------------------------------- time --------------------------------------
t1 <- Sys.time()
t1
# "2015-11-16 15:18:20 PST"
class(t1)
# [1] "POSIXct" "POSIXt" 
unclass(t1)
# [1] 1447715901 # the (large) number of seconds since the beginning of 1970.
t2 <- as.POSIXlt(Sys.time())
class(t2)
# [1] "POSIXlt" "POSIXt" 
str(unclass(t2))
# List of 11
# $ sec   : num 31.5
# $ min   : int 21
# $ hour  : int 15
# $ mday  : int 16
# $ mon   : int 10
# $ year  : int 115
# $ wday  : int 1
# $ yday  : int 319
# $ isdst : int 0
# $ zone  : chr "PST"
# $ gmtoff: int -28800
# - attr(*, "tzone")= chr [1:3] "" "PST" "PDT"
t2$min
# [1] 21

# -------------------------- useful functions for Date and time -------------------------------
weekdays(d1)
# [1] "Monday"
months(t1)
# [1] "November"
quarters(t2) # the quarter of the year (Q1-Q4)
# [1] "Q4"

t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
t4
# [1] "1986-10-17 08:24:00 PDT"

# there are a number of operations that you can perform on dates and times, including arithmetic operations (+ and -) and comparisons (<, ==, etc.)
Sys.time() > t1
# [1] TRUE
Sys.time() - t1
# Time difference of 17.97622 mins
difftime(Sys.time(), t1, units = 'days')
# Time difference of 0.01340725 days
