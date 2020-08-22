data_url<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspe   cdata.zip"
download.file(data_url,"rprog_data_specdata.zip")
unzip("rprog_data_specdata.zip")

complete<-function(directory="specdata",id=vector("numeric",1:332)) {
  
  lista_semi<-list.files("specdata",full.names = TRUE)
  
  lista_final<-vector("list",length = length(lista_semi))
    for (i in seq_along(lista_final)) {
    lista_final[[i]]<-read.csv(lista_semi[[i]])
    }
  
  cuadro_semi<-do.call(rbind,lista_final)
  cuadro_filtrado<-complete.cases(cuadro_semi)
  cuadro_final<-cuadro_semi[cuadro_filtrado,]
  cuadro_id<-cuadro_final[which(cuadro_final[,"ID"]%in%id),]
  tabla_final<-data.frame(table(cuadro_id$ID))
  names(tabla_final)<-c("ID","nobs")
  tabla_final
}

complete("specdata",25:30)
complete("specdata",25:132)
complete("specdata",23)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
