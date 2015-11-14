# ----------------------------- traceback ----------------------------------
mean(x)
# Error in mean(x) : object 'x' not found
traceback()
# 1: mean(x)

lm(y ~ x)
# Error in eval(expr, envir, enclos) : object 'y' not found
traceback()
# 7: eval(expr, envir, enclos)
# 6: eval(predvars, data, env)
# 5: model.frame.default(formula = y ~ x, drop.unused.levels = TRUE)
# 4: stats::model.frame(formula = y ~ x, drop.unused.levels = TRUE)
# 3: eval(expr, envir, enclos)
# 2: eval(mf, parent.frame())
# 1: lm(y ~ x)

# ------------------------------ debug -----------------------------------
debug(lm)
lm(y ~ x)
## Source Viewer
# function (formula, data, subset, weights, na.action, method = "qr", 
#           model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
#           contrasts = NULL, offset, ...) 
# {
#   ret.x <- x
#   ret.y <- y
#   cl <- match.call()
#   ...
#   if (!qr) 
#     z$qr <- NULL
#   z
# }

# Browse[2]> n
# debug: ret.x <- x
# Browse[2]> n
# debug: ret.y <- y
# Browse[2]> n
# debug: cl <- match.call()
# Browse[2]> n
# debug: mf <- match.call(expand.dots = FALSE)
# Browse[2]> n
# debug: m <- match(c("formula", "data", "subset", "weights", "na.action", 
#                     "offset"), names(mf), 0L)

# ---------------------------------- recover ---------------------------------
options(error = recover) # set a global option
read.csv("nosuchfile")
# Error in file(file, "rt") : cannot open the connection
# In addition: Warning message:
#   In file(file, "rt") :
#   cannot open file 'nosuchfile': No such file or directory
# 
# Enter a frame number, or 0 to exit   
# 
# 1: read.csv("nosuchfile")
# 2: read.table(file = file, header = header, sep = sep, quote = quote, dec = dec, f
# 3: file(file, "rt")
#               
# Selection: 