library(datasets)

data("iris")
class(iris)
dim(iris)
head(iris)
table(iris$Species)

# Boxplot: good for compparing data
boxplot(iris)
## Red line is mean
abline(h = mean(iris$Petal.Length), col="red")

# Historgram
hist(iris$Petal.Length)
## more granular
hist(iris$Sepal.Length, breaks = 100, col = "green")

# Barplot
barplot(table(iris$Species))


# Lattice ----
library(lattice)
plot(iris$Sepal.Width, iris$Sepal.Length)
xyplot(Sepal.Length ~ Sepal.Width | Species, data = iris)

