# collect first names
start <- Sys.time()
# Get amle first names
url <- 'http://names.mongabay.com/male_names_alpha.htm'
print(url)
tables <- readHTMLTable(url, colClasses=c('character', 'numeric', 'character', 'numeric'), stringsAsFactors=FALSE)
dfmale <- tables$myTable
colnames(dfmale) <- c('Name', 'FrequencyPct', 'ApproximateNum', 'Rank')
dfmale$ApproximateNum <- as.numeric(gsub(',', '', dfmale$ApproximateNum))
malenamevec <- base::sample(dfmale[1,1], dfmale[1,3], replace=TRUE)
for (i in 2:dim(dfmale)[1]) {
     malenamevec <- c(malenamevec, base::sample(dfmale[i,1], dfmale[i,3], replace=TRUE))
}
saveRDS (malenamevec, 'malenamevec.txt')

# Get female first names
url <- 'http://names.mongabay.com/female_names_alpha.htm'
print(url)
tables <- readHTMLTable(url, colClasses=c('character', 'numeric', 'character', 'numeric'), stringsAsFactors=FALSE)
dffemale <- tables$myTable
colnames(dffemale) <- c('Name', 'FrequencyPct', 'ApproximateNum', 'Rank')
dffemale$ApproximateNum <- as.numeric(gsub(',', '', dffemale$ApproximateNum))
femalenamevec <- base::sample(dffemale[1,1], dffemale[1,3], replace=TRUE)
for (i in 2:dim(dffemale)[1]) {
     femalenamevec <- c(femalenamevec, base::sample(dffemale[i,1], dffemale[i,3], replace=TRUE))
}
saveRDS (femalenamevec, 'femalenamevec.txt')

# # put first names in a single table
# dfnames <- rbind(dfmale, dffemale)
# 
# namevec <- base::sample(dfnames[1,1], dfnames[1,3], replace=TRUE)
# for (i in 2:dim(dfnames)[1]) {
#      namevec <- c(namevec, base::sample(dfnames[i,1], dfnames[i,3], replace=TRUE))
# }
#      
# saveRDS(namevec, 'firstnames.txt')     
end <- Sys.time()
end-start
