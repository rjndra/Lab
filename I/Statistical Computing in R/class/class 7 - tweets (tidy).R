setwd("D:/R programming runs/Class")
load(file = "rdmTweets.RData")
tweets <- rdmTweets
tweets

(n.tweet <- length(tweets))

strwrap(tweets[[154]]$text, width = 55)
strwrap(tweets[[154]]$text, width = 62)

tweets[1:3]

############ Loading twitterR & convert to data frame ########
library(twitteR)
#convert tweets to a data frame
df <- twListToDF(tweets)
str(df)
head(df)


library(tm)
#build a corpus
myCorpus <- Corpus(VectorSource(df$text))
#inspect first 3 elements
inspect(myCorpus[1:3])


#convert to lowercase
myCorpus <- tm_map(myCorpus, tolower)
inspect(myCorpus[1:3])

#remove punctuation and numbers
myCorpus <- tm_map(myCorpus, removePunctuation)
inspect(myCorpus[1:3])

myCorpus <- tm_map(myCorpus, removeNumbers)
inspect(myCorpus[1:3])


#remove URLs, http followed by non-space characters
removeURL <- function(x) gsub("http[^[:space:]]*", "", x)

myCorpus <- tm_map(myCorpus, removeURL)
inspect(myCorpus[1:3])

#remove r and big from the list of stopwords
#i.e. don't remove r & big from corpus
myStopwords <- setdiff(stopwords("english"), c("r", "big"))

#remove stopwords
myCorpus <- tm_map(myCorpus, removeWords, myStopwords)
inspect(myCorpus[1:3])


######## Warning - be careful with stem #########

#keep a copy of corpus
myCorpusCopy <- myCorpus

#stem words  --- sets verb3, v4 to v1
myCorpus <- tm_map(myCorpus, stemDocument)
inspect(myCorpus[1:3])


#stem completion   - should show v1 to v4 from dictionary
#myCorpus <- tm_map(myCorpus, stemCompletion, dictionary=myCorpusCopy)
inspect(myCorpus[1:3])

#text
myTdm <- TermDocumentMatrix(myCorpus)
str(myTdm)
head(myTdm)

#find most frequent used terms
#frequentWord <- tm_map(myTdm, findMostFreqTerms(myTdm$dimnames$Terms))
freq <- findFreqTerms(myTdm, lowfreq=10, highfreq=Inf)
str(freq)
#associated terms
library("graph")
library("Rgraphviz")
plot(myTdm, term=freq, corThreshold=0.05, weighting=T)

library(wordcloud)
tdm_m <- as.matrix(myTdm)
sort_freq <- sort(rowSums(tdm_m), decreasing = T)
wordcloud(words=names(sort_freq), freq = sort_freq)
