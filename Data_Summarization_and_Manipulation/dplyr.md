## dplyr Verbs
* select : return a subset of the columns of a data frame
* filter : extract a subset of rows from a data frame based on logical conditions
* arrange : reorder rows of a data frame
* rename : rename variables in a data frame
* mutate : add new variables/columns or transform existing variables
* summarise/summarize : generate summary statistics of different variables in the data frame, possibly within strata

There is also a handy print method that prevents you from printing a lot of data to the console.

## dplyr Properties
* The first argument is a data frame.
* The subsequent arguments describe what to do with it, and you can refer to columns in the data frame directly without using the $ operator (just use the names).
* The result is a new data frame.
* Data frames must be properly formatted and annotated for this to all be useful 