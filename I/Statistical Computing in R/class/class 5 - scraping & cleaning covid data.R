library(rvest)
library(dplyr)
simple <- read_html("https://dataquestio.github.io/web-scraping-pages/simple.html")
simple %>% html_nodes("p") %>% html_text()

wiki_page <- read_html("https://en.wikipedia.org/wiki/COVID-19_pandemic_in_Nepal")
wiki_page %>% html_nodes(".mw-page-title-main") %>% html_text()

covid_table <- wiki_page %>% html_nodes(".COVID-19_pandemic_data_Nepal_medical_cases .wikitable") %>% html_table()
covid_table

covid_table <- covid_table[[1]]
covid_table
str(covid_table)

str(wiki_page)
wiki_page %>% html_nodes("table")
#[7] maa rahexa table, indexing dot(.) garera retrieve garne

covid_table1 <- wiki_page %>% html_nodes("table") %>% .[7] %>% html_table()


covid_table1 <- wiki_page %>% html_nodes("table") %>% .[7] %>% html_table() %>% .[[1]]
str(covid_table1)

head(covid_table1)

names(covid_table) <- paste(names(covid_table), covid_table[1,], sep="_")
head(covid_table)

covid_table <- covid_table[-1,]
str(covid_table)

colnames(covid_table) <- c("Date", "Confirmed_Cases_Total", "Confirmed_Cases_New", "Confirmed_Cases_Active", "Recoveries_Total", "Recoveries_New", "Deaths_Total", "Deaths_New", "PCR_Total", "PCR_New", "TPR", "RR", "CFR", "Ref")
str(covid_table)

head(covid_table)
