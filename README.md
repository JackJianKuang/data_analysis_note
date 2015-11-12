# data_analysis_note
Cisco Skillzone : data analysis track study notes

## In general look at the documentation of APIs
- httr allows GET, POST, PUT, DELETE requests if you are authorized
- You can authenticate with a user name or a password
- Most modern APIs use something like oauth
- httr works well with Facebook, Google, Twitter, Github, etc.

## Reading From Other Sources

### Interacting more directly with files
* file - open a connection to a text file
* url - open a connection to a url 
* gzfile - open a connection to a .gz file
* bzfile - open a connection to a .bz2 file
* ?connections for more information
* Remember to close connections

### foreign package
* Loads data from Minitab, S, SAS, SPSS, Stata, Systat
* Basic functions read.foo
  - read.arff (Weka)
  - read.dta (Stata)
  - read.mtp (Minitab)
  - read.octave (Octave)
  - read.spss (SPSS)
  - read.xport (SAS)
