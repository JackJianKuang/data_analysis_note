# --------------------------- apply --------------------------------
# apply is used to a evaluate a function (often an anonymous one) over the margins of an array.
#   - It is most often used to apply a function to the rows or columns of a matrix
#   - It can be used with general arrays, e.g. taking the average of an arrary of matrices
#   - It is not really faster than writing a loop, but it works in one line!

str(apply)
# function (X, MARGIN, FUN, ...)  
#   - X is an array
#   - MARGIN is an integer vector indicating which margins should be "retained".
#   - FUN is a function to be applied
#   - ... is for other arguments to be passed to FUN

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)
# [1]  0.331471904 -0.483925107  0.246108941  0.107123357 -0.100198737
# [6] -0.354090924 -0.005933548 -0.215369945 -0.121862901  0.322612587
apply(x, 1, sum)
#  [1] -0.04243484  4.99344550  0.99926962  1.35567429 -3.16824530
#  [6] -0.03616134  0.49415959  4.03801751 -1.31597882 -1.05350758
# [11]  0.57546256 -1.83585345 -1.96050812 -0.83979518 -0.58615798
# [16] -2.37564245  1.98464667 -0.66296746 -2.36046531 -3.68424538

# col/row sums and means
# For sums and means of matrix dimensions, we have some shortcuts.
#   - rowSums = apply(x, 1, sum)
#   - rowMeans = apply(x, 1, mean)
#   - colSums = apply(x, 2, sum)
#   - colMeans = apply(x, 2, mean)

# Other Ways to Apply
## Quantiles of the rows of a matrix.
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs=c(0.25, 0.75))
#           [,1]       [,2]       [,3]       [,4]       [,5]
# 25% -0.7729746 -0.5086419 -0.2836960 -0.8274831 -0.8542063
# 75% -0.2713589  1.2785827  0.8143461  1.0057642 -0.1574295
#           [,6]        [,7]       [,8]       [,9]      [,10]
# 25% -1.10404828 -1.15983799 -0.8953179 -1.1940326 -0.2978222
# 75%  0.06869911  0.08996056  1.1188843  0.1162545  0.4478762
#         [,11]      [,12]       [,13]      [,14]      [,15]
# 25% -1.5056728 -0.1250096 -0.07297774 -0.7864480 -0.2568494
# 75%  0.4789008  0.6387159  0.92984335  0.4158332  0.7834781
#         [,16]     [,17]        [,18]       [,19]      [,20]
# 25% -0.5310266 0.3543899 -1.157808179 -1.18144879 -0.8626827
# 75%  0.2296144 1.1354671  0.005102224 -0.09613821  0.0092817

a <- array(rnorm(2*2*10), c(2,2,10))
apply(a, c(1,2), mean)
#           [,1]      [,2]
# [1,]  0.1842465 0.3403003
# [2,] -0.1675047 0.3923046
rowMeans(a, dims = 2)
#           [,1]      [,2]
# [1,]  0.1842465 0.3403003
# [2,] -0.1675047 0.3923046