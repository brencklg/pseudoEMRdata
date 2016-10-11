con <- url ('http://names.mongabay.com/data/1000.html')
htmlcode <- readLines(con)
close(con)

pages <- htmlcode[162:211]
df <- NULL

a <- substr(pages[1], str_locate(pages[1], '=')+1, str_locate(pages[1], '>')-1)
url <- paste('http://names.mongabay.com/data/', a, sep='')
print(url)
tables <- readHTMLTable(url)
df <- tables$myTable
for (i in 2:length(pages)) {
     a <- substr(pages[i], str_locate(pages[i], '=')+1, str_locate(pages[i], '>')-1)
     url <- paste('http://names.mongabay.com/data/', a, sep='')
     print(url)
     tables <- readHTMLTable(url)
     df <- rbind(df, tables$myTable)
     
     Sys.sleep(rnorm(1, mean=15, sd=2))
}
saveRDS(df, 'lastnametable.txt')
