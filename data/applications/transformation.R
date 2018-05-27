###todo
### find a way to automatise the reagent_type
library (readxl)
library(tidyverse)

#-- function to create krot:
createkrot <- function(table, Name = Krot_table [1,], standard) {
  krot <- as.data.frame(
    matrix(nrow =length(unique(table$reagent_ID)), ncol = (ncol(Krot_table)+1))
  )
  names(krot)=c("reagent_ID", Name)
  krot$reagent_ID <- unique(table$reagent_ID)
  krot$reagent_type =table$reagent_type[1]
  
  for (i in c(3:ncol(krot))) {
    added_var = standard$Attribute [standard$ReTa_v002_column == names(krot [i])]
    added_var = added_var[!is.na(added_var)]
    result = c()
    if (length (added_var) == 0) {
      result = NA
    } else if (length (added_var) == 1) {
      result <- table [, names(table) == added_var]
    } else{
      for (j in c(1:nrow(krot))) {
        toadd = c()
        for (k in c(1:length(added_var))) {
          added_vartemp <- added_var[k]
          added_value <- table [, names(table) == added_vartemp]
          
          if (!is.na(table [j, names(table) == added_vartemp])) {
            toadd = c(toadd, paste (added_vartemp, value = table [j, names(table) == added_vartemp], sep = "-:"))
          }
          
        }
        result = c(result, paste(toadd, collapse = ";"))
      }
      
      
    }
    krot[, i] =   result
  }
  return(krot)
}

#- read xlsx file, get all sheets: todo automatise number of sheets

master  <- read_excel("data/example/immuno_Dmel_001.xlsx",
                      sheet = 1)
var = vector("list", length= nrow(master)-1)
for (sheet in c(2:nrow(master))){
  a<- read_excel("data/example/immuno_Dmel_001.xlsx",
                 sheet = master$SHEET[sheet])
  a$reagent_type <- master$reagent_type[sheet]
  var[[sheet-1]] <-a
  
}


# var1 <- read_excel("data/example/immuno_Dmel_001.xlsx",
#                    sheet = master$SHEET[2])
# var1$reagent_type = master$reagent_type[2]
# 
# var2 <- read_excel("data/example/immuno_Dmel_001.xlsx", na = "NA",
#                    sheet = 3)
# var2$reagent_type = master$reagent_type[3]
# 
# var3 <- read_excel("data/example/immuno_Dmel_001.xlsx",  na = "NA",
#                    sheet = 4)
# var3$reagent_type = master$reagent_type[4]



#- read standards to do automatise to read all existing standards

Drosophila_melanogaster <- read_delim("data/Standards/Drosophila_melanogaster.csv",
                                    "\t", escape_double = FALSE, na = "NA",
                                    trim_ws = TRUE)

Antibodies <- read_delim("data/Standards/Antibodies.csv",
"\t", escape_double = FALSE, na = "NA",
trim_ws = TRUE)

Krot_table <- read_delim("data/Standards/reagent_table_v002.csv", 
                              "\t", escape_double = FALSE, col_names = FALSE, 
                              trim_ws = TRUE)

#- create full krot

# table = var2
# Name = Krot_table [1,]
# standard = Drosophila_melanogaster
# 
#   table = var3
#   Name = Krot_table [1,]
#   standard = Antibodies
#   

  
  Krot =rbind(
    createkrot(var[[2]], standard = Drosophila_melanogaster),
    createkrot(var[[3]], standard = Antibodies)
  )  
  View (Krot)
#- export restricted krot