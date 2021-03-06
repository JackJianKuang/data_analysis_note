# - plyr provides a consistent wrapper around apply functions
# - lubridate provides a consistent wrapper around the date-time functions
# - stringr provides a consistent wrapper around the string manipulation functions

# install.packages("learningr")
data(english_monarchs, package = "learningr")
head(english_monarchs)

# ------------------------------------- str_detect ----------------------------------------------
library(stringr)
multiple_kingdoms <- str_detect(english_monarchs$domain, fixed(","))
class(multiple_kingdoms)
# [1] "logical"
english_monarchs[multiple_kingdoms, c("name", "domain")]
#                           name                    domain
# 17                        Offa       East Anglia, Mercia
# 18                        Offa East Anglia, Kent, Mercia
# 19           Offa and Ecgfrith East Anglia, Kent, Mercia
# 20                    Ecgfrith East Anglia, Kent, Mercia
# 22              C<U+009C>nwulf East Anglia, Kent, Mercia
# 23 C<U+009C>nwulf and Cynehelm East Anglia, Kent, Mercia
# 24              C<U+009C>nwulf East Anglia, Kent, Mercia
# 25                    Ceolwulf East Anglia, Kent, Mercia
# 26                   Beornwulf       East Anglia, Mercia
# 82      Ecgbehrt and 苩helwulf              Kent, Wessex
# 83      Ecgbehrt and 苩helwulf      Kent, Mercia, Wessex
# 84      Ecgbehrt and 苩helwulf              Kent, Wessex
# 85    苩helwulf and 起elstan I              Kent, Wessex
# 86                   苩helwulf              Kent, Wessex
# 87 苩helwulf and 起elberht III              Kent, Wessex
# 88               起elberht III              Kent, Wessex
# 89                  苩helred I              Kent, Wessex
# 95                       Oswiu       Mercia, Northumbria

multiple_rulers <- str_detect(english_monarchs$name, ",|and")
english_monarchs$name[multiple_rulers & !is.na(multiple_rulers)]
# [1] Sigeberht and Ecgric                       
# [2] Hun, Beonna and Alberht                    
# [3] Offa and Ecgfrith                          
# [4] C\u009cnwulf and Cynehelm                  
# [5] Sighere and Sebbi                          
# [6] Sigeheard and Swaefred                     
# [7] Eorcenberht and Eormenred                  
# [8] Oswine, Sw鎓behrt, Sw鎓heard               
# [9] Sw鎓behrt, Sw鎓heard, Wihtred              
# [10] 起elberht II, 苐fric and Eadberht I        
# [11] 起elberht II and Eardwulf                  
# [12] Eadberht II, Eanmund and Sigered           
# [13] Heaberht and Ecgbehrt II                   
# [14] Ecgbehrt and 苩helwulf                     
# [15] Ecgbehrt and 苩helwulf                     
# [16] Ecgbehrt and 苩helwulf                     
# [17] 苩helwulf and 起elstan I                   
# [18] 苩helwulf and 起elberht III                
# [19] Penda and Eowa                             
# [20] Penda and Peada                            
# [21] 苩helred, Lord of the Mercians             
# [22] 苩helfl鎑, Lady of the Mercians            
# [23] 苐fwynn, Second Lady of the Mercians       
# [24] H醠fdan and Eowils                         
# [25] No餳elm and Watt                           
# [26] No餳elm and Bryni                          
# [27] No餳elm and Osric                          
# [28] No餳elm and 起elstan                       
# [29] 苐fwald, Oslac and Osmund                  
# [30] 苐fwald, Ealdwulf, Oslac and Osmund        
# [31] 苐fwald, Ealdwulf, Oslac, Osmund and Oswald
# [32] Cenwalh and Seaxburh                       
# 211 Levels: Adda 起elbehrt 起elberht I ... Wulfhere

# -------------------------------------- str_split -----------------------------------------------
individual_rulers <- str_split(english_monarchs$name, ", | and ")
head(individual_rulers[sapply(individual_rulers, length) > 1])
# [[1]]
# [1] "Sigeberht" "Ecgric"   
# 
# [[2]]
# [1] "Hun"     "Beonna"  "Alberht"
# 
# [[3]]
# [1] "Offa"     "Ecgfrith"
# 
# [[4]]
# [1] "C\u009cnwulf" "Cynehelm"    
# 
# [[5]]
# [1] "Sighere" "Sebbi"  
# 
# [[6]]
# [1] "Sigeheard" "Swaefred" 

# ------------------------------------------ str_count ------------------------------------------------
th <- c("th", "�", "�")
