# load libraries

library(stringr)
library(ggplot2)
library(dplyr)

# Get age distirbution data
con <- url ('http://www.censusscope.org/us/chart_age.html')
htmlcode <- readLines(con)
close(con)

# the year 2,000 age data table is in rows 753 to 1218 of the html page
inpdata <- htmlcode[753:1218]

# select out the table data
inpdata <- inpdata[grepl('<td class=', inpdata)]
inpdata <- inpdata[11:105]

#pull the table cell values into a vector
outdata <- NULL
for (i in 1:length(inpdata)) {
     outdata[i] <- substr(inpdata[i], str_locate(inpdata[i], '>')+1, str_locate(inpdata[i], '</td')-1)
}

# move the data into a matrix of 19 rows by 5 columns and convert to a data frame
m <-matrix(outdata, nrow=19, ncol=5, byrow=TRUE)
df <- as.data.frame(m, stringsAsFactors=FALSE)

# rownames are in the first column
# rownames (df) <- df$V1
# df <- select(df, 2:5)
colnames(df) <- c('Bin', 'MaleNum', 'MalePct', 'FemaleNum', 'FemalePct')

df2 <- filter(df, Bin != 'Total Population')
df2$MaleNum <- as.numeric(gsub(',', '', df2$MaleNum))
df2$MalePct <- as.numeric(gsub('%', '', df2$MalePct))
df2$FemaleNum <- as.numeric(gsub(',', '', df2$FemaleNum))
df2$FemalePct <- as.numeric(gsub('%', '', df2$FemalePct))
df2 <- mutate(df2, TotalNum=(MaleNum+FemaleNum), TotalPct=(MalePct+FemalePct))
df2 <- mutate(df2, TotalK = TotalNum/1000)
df2 <- mutate(df2, BinMin = sub('-[0-9]*', '', df2$Bin))
df2$BinMin <- sub('\\+', '', df2$BinMin)
df2$BinMin <- as.numeric(df2$BinMin)
df2 <- mutate(df2, BinMax = sub('^[0-9]*-', '', df2$Bin))
df2$BinMax <- sub('85\\+', '100', df2$BinMax)
df2$BinMax <- as.numeric(df2$BinMax)

plot2 <- ggplot(data=df2, aes(x=Bin, y=as.numeric(MalePct))) +
     geom_bar(stat="identity") +
     xlab ('') + ylab('Number of Males') + ylim(0., 5.0) +
     theme(axis.text.x = element_text(angle=60, size=8, hjust=1)) +
     ggtitle ('Male Population by Age')
plot2

plot3 <- ggplot(data=df2, aes(x=Bin, y=as.numeric(FemalePct))) +
     geom_bar(stat="identity") +
     xlab ('') + ylab('Number of Females') + ylim(0., 5.0) +
     theme(axis.text.x = element_text(angle=60, size=8, hjust=1)) +
     ggtitle ('Female Population by Age')
plot3

plot4 <- ggplot(data=df2, aes(x=Bin, y=as.numeric(TotalPct))) +
     geom_bar(stat="identity") +
     xlab ('') + ylab('% of Population') + ylim(0., 9.0) +
     theme(axis.text.x = element_text(angle=60, size=8, hjust=1)) +
     ggtitle ('Total Population by Age')
plot4

agesample <- runif(df2[1,8], min=df2[1,9], max=df2[1,10])
for (i in 2:dim(df2)[1]) {
     agesample <- c(agesample, runif(df2[i,8], min=df2[i,9], max=df2[i,10]))
}
length(agesample)
saveRDS(agesample, 'agesample.txt')
