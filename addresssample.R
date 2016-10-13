library("XML")

# generate a list of latitudes and longitudes to fish for addresses
latbase <- 42.2414105
lngbase <- -71.8526324
count <- 0
df <- data.frame(matrix(nrow=10000, ncol=2))
for (i in 1:100) {
     latbase <- latbase + 0.000881546
     lngbase <--71.8526324
     for (j in 1:100) {
          lngbase <- lngbase + 0.00233185
          count <- count + 1
          df[count,1] <- latbase
          df[count,2] <- lngbase
     }
}



link<-matrix(NA, nrow=5000, ncol=1)
duh <- list()
semi<-list()
add1<-matrix(NA, ncol=1, nrow=5000)
add2<-matrix(NA, ncol=1, nrow=5000)
add3<-matrix(NA, ncol=1, nrow=5000)
for(i in 501:5000){
     link[i,1]<- paste("https://maps.googleapis.com/maps/api/geocode/xml?",
                      "latlng=",df[i,1], ',', df[i,2],"&key=", APIKEY, sep="")
     duh[i]<-list(readLines(link[i,1]))
     duh[[i]] <- xmlTreeParse(duh[[i]], useInternalNodes=TRUE)
     duh[[i]]<-getNodeSet(duh[[i]], "//formatted_address")
     semi[[i]]<- xmlToDataFrame(duh[[i]],stringsAsFactors=FALSE)
     if (length(semi[[i]] > 1)) {
          add1[i] <- semi[[i]][1,1]
          add2[i] <- semi[[i]][2,1]
          add3[i]<-semi[[i]][3,1]
     }
}

final <- cbind(add1,add2,add3)
final[,1]
saveRDS(final[101:500], 'address3.txt')
