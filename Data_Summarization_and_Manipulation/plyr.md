## Three drawbacks of *apply functions family:
* Firstly, the names are a bit obscure, what the “t” in tapply stands for.
* Secondly, the arguments aren’t entirely consistent. Most of the functions take a data object first and a function argument second, but mapply swaps the order, and tapply takes the function for its third argument. The data argument is sometimes X and sometimes object, and the simplification argument is sometimes simplify and sometimes SIMPLIFY.
* Thirdly, the form of the output isn’t as controllable as it could be. Getting your results as a data frame — or discarding the result — takes a little bit of effort.

## plyr package
The package contains a set of functions named **ply, where the blanks (asterisks) denote the form of the input and output, respectively. 
* There is no direct replacement for mapply, though the m*ply functions allow looping with multiple arguments. 
* Likewise, there is no replacement for vapply or rapply.