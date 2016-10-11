# Load the library XML
library(XML)

# go get the first 1000 names

theurl <- 'http://names.mongabay.com/data/1000.html'
tables <- readHTMLTable(theurl)
df1000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/2000.html'
tables <- readHTMLTable(theurl)
df2000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/3000.html'
tables <- readHTMLTable(theurl)
df3000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/4000.html'
tables <- readHTMLTable(theurl)
df4000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/5000.html'
tables <- readHTMLTable(theurl)
df5000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/6000.html'
tables <- readHTMLTable(theurl)
df6000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/7000.html'
tables <- readHTMLTable(theurl)
df7000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/8000.html'
tables <- readHTMLTable(theurl)
df8000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/9000.html'
tables <- readHTMLTable(theurl)
df9000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/2000.html'
tables <- readHTMLTable(theurl)
df2000 <- tables$myTable

# next 1000
theurl <- 'http://names.mongabay.com/data/10000.html'
tables <- readHTMLTable(theurl)
df10000 <- tables$myTable
