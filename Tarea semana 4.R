data_url<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"
data_set<-download.file(data_url,"ProgAssignment3-data.zip")
unzip("ProgAssignment3-data.zip")

#1. plot the 30-days mortality ratos for heart attack

#esto me permite extraer las columnas por separado y graficarlas
#con su frecuencia como eje Y, y su valor como eje X. ES importante que
#la parte que dice as.numeric sea puesta porque anteriormente
#al momento de leer el archivo lo está leyendo todo como caracteres
#entonces no puede hacer cálculos matemáticos con caracteres.
outcome<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
head(outcome)
outcome[,11]<-as.numeric(outcome[,11])
hist(outcome[, 11])
summary(outcome[,11])

#2. FInding the best hospital in the state
best <- function(state, outcome) {
          tabla_completa<-read.csv("outcome-of-care-measures.csv",
                    colClasses = "character")
          tabla_outcome_parcial<-tabla_completa[which(tabla_completa[,7]
                    ==state),]
          variable_outcome<-paste(
                    "Hospital.30.Day.Death..Mortality..Rates.from.",outcome,
                    sep = "")
          tabla_outcome_final<-tabla_outcome_parcial[[variable_outcome]]
          tabla_outcome_final
}