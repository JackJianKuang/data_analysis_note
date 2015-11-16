# df_fixedwith <- read.fwf("http://www.cpc.ncep.noaa.gov/data/indices/sstoi.indices", header = TRUE, 
#                          widths = list(c(3,4,9,7,7,7,8,8,8,8), c(5,4,8,8,8,8,8,8,8,8)) )

df_fixedwith <- read.fwf("http://www.cpc.ncep.noaa.gov/data/indices/sstoi.indices", skip = 1,
                         widths =  c(5,4,8,8,8,8,8,8,8,8) )
df_header <- read.fwf("http://www.cpc.ncep.noaa.gov/data/indices/sstoi.indices",
                                widths = c(3,4,9,7,7,8,8,8,8,8), n=1, stringsAsFactors=FALSE)

names(df_fixedwith) <- sapply(df_header,as.character)

View(df_fixedwith)

#rm(df_fixedwith)

View(df_header)

