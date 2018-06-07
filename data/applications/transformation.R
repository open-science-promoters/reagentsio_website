###todo
### find a way to automatise the reagent_type
### #todo get "derived_from" reagents into allreagents
### todo automatise number of sheets

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
    } else if (i ==3) {
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

master  <- read_excel("data/example/immuno_Dmel_001.xlsx", na= "NA",
                      sheet = 1)
var = vector("list", length= nrow(master)-1)
for (sheet in c(2:nrow(master))){
  a<- read_excel("data/example/immuno_Dmel_001.xlsx", na= "NA",
                 sheet = master$SHEET[sheet])
  a$reagent_type <- master$reagent_type[sheet]
  var[[sheet-1]] <-a
  
}

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

  
  Krot =rbind(
    createkrot(var[[2]], standard = Drosophila_melanogaster),
    createkrot(var[[3]], standard = Antibodies)
  )  
  View (Krot2)
  
#- filter Krot for useful data
  #todo get "derived_from" reagents into allreagents
  allreagents = c(unique(var[1][[1]]$reagent_ID))
  Krot2 = Krot %>% filter (reagent_ID %in% allreagents)
#- export restricted krot
  
  write_delim(Krot2, path= "data/example/Krot_export_full.csv", delim = "\t")
  