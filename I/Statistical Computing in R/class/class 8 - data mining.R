library(pdftools)
library(tm)
library(tidyverse)
library(wordcloud)
library(tidytext)

setwd("D:/R programming runs/Class")
kura <- list.files(pattern = "pdf$")
kuracorp <- Corpus(URISource(kura), readerControl=list(reader = readPDF()))
kuracorp

tdm <- TermDocumentMatrix(kuracorp, control = list(removePunctuation=T, stopwords=T, tolower=T, removeNumbers=T))
inspect(tdm)

kura.freq <- findFreqTerms(tdm, lowfreq=10, highfreq=Inf)
kura.freq

kura.matrix <- as.matrix(tdm[kura.freq,])
kura.matrix

hist(kura.matrix)
kura.sort <- sort(apply(kura.matrix,1,sum), decreasing=T)
kura.sort

kura.df <- as.data.frame(kura.sort)
kura.df

kura.df <- cbind(rownames(kura.df), kura.df)
rownames(kura.df) <- NULL
colnames(kura.df) <- c("word", "count")
kura.df

hist(kura.df$count)
plot(kura.df$count, type = "h")

p.words <- c("yolmo", "kur", "body", "death", "culture", "nepal")
p.words

kura.tidy <- tidy(kuracorp)
kura.tidy

kura.data <- kura.tidy %>% select(-author, -datetimestamp, -description, -heading, -id, -language, -origin) %>% unnest_tokens(word, text) %>% mutate(position = row_number()) %>% filter(!word %in% tm::stopwords("en"))
kura.data

library(fuzzyjoin)
kura.prox <- kura.data %>% filter(word == "saturation") %>% select(focus_term = word, focus_position = position) %>% difference_inner_join(kura.data, by = c(focus_position = "position"), max_dist = 5) %>% mutate(distance = abs(focus_position - position))
kura.prox

kura.prox.group <- kura.prox %>% group_by(word) %>% summarize(number = n(), maximum_distance = max(distance), minimum_distance = min(distance), average_distance = mean(distance)) %>% arrange(desc(number))
kura.prox.group

kura.ana <- kura.prox.group %>% filter(word %>% p.words)



library("graph")
library("Rgraphviz")


tdm <- TermDocumentMatrix(kuracorp)
tdm <- removeSparseTerms(tdm, 0.5)
kura.freq <- findFreqTerms(tdm, lowfreq=20, highfreq=Inf)


plot(tdm, term=kura.freq, corThreshold=0.1, weighting=T)


freq <- sort(rowSums(tdm_m), decreasing = T)
wordcloud(words=names(freq), freq = freq)