# generate a list of latitudes and longitudes to fish for addresses

latbase <- 42.018089
lngbase <- -73.591323
count <- 0
df <- data.frame(matrix(nrow=10000, ncol=2))
for (i in 1:100) {
     latbase <- latbase + .0083634
     for (j in 1:1000) {
          lngbase <- lngbase + .02730725
          count <- count + 1
          df[count,1] <- latbase
          df[count,2] <- lngbase
     }
}
df
