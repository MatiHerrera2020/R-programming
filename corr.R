com<-complete("specdata",1:332)

corr<-function(directory="specdata",threshold=0) {
  id_superiores<-com[which(com[,"nobs"]>=threshold),]
  id_superiores_na<-complete.cases(id_superiores)
  id_superiores_filtrados<-id_superiores[id_superiores_na,]
  vector_id_superior<-id_superiores_filtrados[,1]
  vector_id_superior_1<-as.numeric(vector_id_superior)
  
  lista_semi<-list.files("specdata",full.names = TRUE)
  lista_final<-vector("list",length = length(lista_semi))
  for (i in seq_along(lista_final)) {
    lista_final[[i]]<-read.csv(lista_semi[[i]])
  }
  
  cuadro_semi<-do.call(rbind,lista_final)
  cuadro_filtrado<-complete.cases(cuadro_semi)
  cuadro_final<-cuadro_semi[cuadro_filtrado,]
  
  data_corr<-cuadro_final[which(cuadro_final[,"ID"]%in%vector_id_superior_1),]
  cor(x=data_corr[,2],y=data_corr[,3])
}
cr<-corr("specdata",500)
head(cr)
summary(cr)

