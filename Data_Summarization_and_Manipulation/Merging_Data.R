if(!file.exists("./data")){dir.create("./data")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv")
download.file(fileUrl2, destfile = "./data/solutions.csv")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews, 2)
head(solutions, 2)

## Merging data -merge()
names(reviews)
names(solutions)
mergedData = merge(reviews, solutions, by.x = "solution_id", by.y = "id", all = TRUE)
head(mergedData)
#   solution_id id reviewer_id    start.x     stop.x time_left.x accept
# 1           1  4          26 1304095267 1304095423        2089      1
# 2           2  6          29 1304095471 1304095513        1999      1
# 3           3  1          27 1304095698 1304095758        1754      1
# 4           4  2          22 1304095188 1304095206        2306      1
# 5           5  3          28 1304095276 1304095320        2192      1
# 6           6 16          22 1304095303 1304095471        2041      1
#   problem_id subject_id    start.y     stop.y time_left.y answer
# 1        156         29 1304095119 1304095169        2343      B
# 2        269         25 1304095119 1304095183        2329      C
# 3         34         22 1304095127 1304095146        2366      C
# 4         19         23 1304095127 1304095150        2362      D
# 5        605         26 1304095127 1304095167        2345      A
# 6        384         27 1304095131 1304095270        2242      C
### Default - merge all common column names
intersect(names(solutions), names(reviews))
# [1] "id"        "start"     "stop"      "time_left"
mergedData2 = merge(reviews, solutions, all=TRUE)
head(mergedData2)
#   id      start       stop time_left solution_id reviewer_id accept problem_id subject_id answer
# 1  1 1304095119 1304095169      2343          NA          NA     NA        156         29      B
# 2  1 1304095698 1304095758      1754           3          27      1         NA         NA   <NA>
# 3  2 1304095119 1304095183      2329          NA          NA     NA        269         25      C
# 4  2 1304095188 1304095206      2306           4          22      1         NA         NA   <NA>
# 5  3 1304095127 1304095146      2366          NA          NA     NA         34         22      C
# 6  3 1304095276 1304095320      2192           5          28      1         NA         NA   <NA>

## Using join in the plyr package
### Faster, but less full featured - defaults to left join
library(plyr)
df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
arrange(join(df1, df2), id)
#    id           x          y
# 1   1 -0.47062901  0.4761355
# 2   2  0.82959756 -0.6905669
# 3   3  0.35603811 -0.2115226
# 4   4  0.38273027  0.2724525
# 5   5  0.70732368  1.3379651
# 6   6 -0.45933222 -2.3837534
# 7   7  1.60385159  0.6758168
# 8   8 -0.60082412  1.5086197
# 9   9 -0.02021775  0.1222402
# 10 10 -2.18230840  0.8815500
### If you have multiple data frames
df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
df3 = data.frame(id=sample(1:10), y=rnorm(10))
dfList = list(df1, df2, df3)
join_all(dfList)
#    id           x           y
# 1   6 -1.32613067 -1.43567195
# 2   4 -0.67277989  2.13369413
# 3   5  1.06523501 -1.60102187
# 4   2  1.10167581 -0.08003525
# 5   8 -0.73339066  0.40506903
# 6   9  0.18390724  1.66499919
# 7   7 -0.09694451  1.18612118
# 8  10 -0.07743990 -0.30422924
# 9   3  0.80514664 -0.97453300
# 10  1  1.62321423  0.37006480