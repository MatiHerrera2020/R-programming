data_url<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspe   cdata.zip"
download.file(data_url,"rprog_data_specdata.zip")
unzip("rprog_data_specdata.zip")

pollutantmean<-function(directory="spectada",pollutant,id=1:332){
  
  archivos_full<-list.files("specdata",full.names = TRUE)
  
  final_list<-vector("list",length = length(archivos_full))
    for (i in seq_along(archivos_full)) {
    final_list[[i]]<-read.csv(archivos_full[[i]])
    }
  
  final_data_frame<-do.call(rbind,final_list)
  id_vector<-final_data_frame[which(final_data_frame[,"ID"]%in%id),]
  media<-vector("numeric",length = 1)
  media<-summary(id_vector[,pollutant],na.rm = TRUE)
  media[["Mean"]]
  
}
pollutantmean("specdata","sulfate",1:10)
pollutantmean("specdata","nitrate",70:72)
pollutantmean("specdata","sulfate",34)
pollutantmean("specdata","nitrate")

