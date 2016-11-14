#Read the data into R
simpsons <- read.csv("simpsons_episodes.csv", stringsAsFactors = FALSE)

library(stringr)
library(ggplot2)
library(reshape2)
library(data.table)

#collapse the title by words
titlewords <- paste(simpsons$title, collapse = " " )

#remove the punctuation from words
titlewords <- gsub("[[:punct:]]", "", titlewords)

#count each character, use grepl to include words like Homers etc.
HomerCount <- sum(grepl('Homer', simpsons$title))
BartCount <- sum(grepl('Bart', simpsons$title))
MargeCount <- sum(grepl('Marge', simpsons$title))
LisaCount <- sum(grepl('Lisa', simpsons$title))
MaggieCount <- sum(grepl('Maggie', simpsons$title))

#creating a data frame plot
plotdata <- data.frame(
  CharacterName = factor(c("Homer","Bart", "Marge", "Lisa", "Maggie"), levels=c(c("Homer","Bart", "Marge", "Lisa", "Maggie"))),
  CountOfEpisodes = c(55, 42, 20, 38, 2))

#Graph to compare how many episodes they were mentioned

ggplot(data=plotdata, aes(x=CharacterName, y=CountOfEpisodes, fill=CharacterName)) +
  geom_bar(stat="identity")

#Episodes that have Homer in Title
homer <- sapply(gregexpr("Homer", simpsons$title), function(x) sum(x > 0))
list_of_homer <- which(homer==1, arr.ind=TRUE)

#Episodes that have Bart in title
bart <- sapply(gregexpr("Bart", simpsons$title), function(x) sum(x > 0))
list_of_bart <- which(bart==1, arr.ind=TRUE)

#Episodes that have Marge in title

marge <- sapply(gregexpr("Marge", simpsons$title), function(x) sum(x > 0))
list_of_marge <- which(marge==1, arr.ind=TRUE)

#Episodes that have Lisa in title

lisa <- sapply(gregexpr("Lisa", simpsons$title), function(x) sum(x > 0))
list_of_lisa <- which(lisa==1, arr.ind=TRUE)

#write results to CSV to combine them

write.csv(list_of_lisa, file = "lisa.csv")
write.csv(list_of_marge, file = "marge.csv")
write.csv(list_of_bart, file = "bart.csv")
write.csv(list_of_homer, file = "homer.csv")

#read new table by character

imdbview <- read.csv("imdbandviews.csv")

#data.table to get the means by character
imdbview.DT <- data.table(imdbview)


#imdb rating mean by character
imdbmeanbycharacter <- imdbview.DT[Name == "Bart" | Name == "Homer" |Name == "Marge" |Name == "Lisa", mean(imdb), by = Name]

#US view mean by character
usviewmeanbycharacter <- imdbview.DT[Name == "Bart" | Name == "Homer" |Name == "Marge" |Name == "Lisa", mean(usview), by = Name]


names(usviewmeanbycharacter) [2] <- paste("usview")
names(imdbmeanbycharacter) [2] <- paste("imdbrating")

#Graph to see view and imdb ratings

ggplot(data = usviewmeanbycharacter, aes(x = Name, y = usview, group = 1, fill = Name)) +
  geom_bar(stat = "identity") +
  geom_line( data =imdbmeanbycharacter, aes(y =imdbrating))

#subset the data to see each characters details
homerfinal <- subset(imdbview.DT, imdbview.DT$Name == "Homer")
lisafinal <- subset(imdbview.DT, imdbview.DT$Name == "Lisa")
margefinal <- subset(imdbview.DT, imdbview.DT$Name == "Marge")
bartfinal <- subset(imdbview.DT, imdbview.DT$Name == "Bart")

#Homer by episode

par(bg = "#FFD90F")
barplot(homerfinal$usview ,col = "#4F76DF", col.main = "#4F76DF" ,xaxt = "n" , xlab = NA, ylab = "US view in millions", 
        main = "Homer")
par(new = T)
plot(homerfinal$imdb, axes = F, xaxt = "n" , xlab = NA, ylab = NA )
axis(side = 4)
mtext(side = 4, line = 3, "IMDb Rating"  )
lines(homerfinal$imdb, type = "o", col = "#F00699")

#Lisa by episode

par(bg = "#FFD90F")
barplot(lisafinal$usview ,col = "#4F76DF", col.main = "#4F76DF" ,xaxt = "n" , xlab = NA, ylab = "US view in millions", 
        main = "Lisa")
par(new = T)
plot(lisafinal$imdb, axes = F, xaxt = "n" , xlab = NA, ylab = NA )
axis(side = 4)
mtext(side = 4, line = 3, "IMDb Rating"  )
lines(lisafinal$imdb, type = "o", col = "#F00699")

#Marge by episode
par(bg = "#FFD90F")
barplot(margefinal$usview ,col = "#4F76DF", col.main = "#4F76DF" ,xaxt = "n" , xlab = NA, ylab = "US view in millions", 
        main = "Marge")
par(new = T)
plot(margefinal$imdb, axes = F, xaxt = "n" , xlab = NA, ylab = NA )
axis(side = 4)
mtext(side = 4, line = 3, "IMDb Rating"  )
lines(margefinal$imdb, type = "o", col = "#F00699")

#Bart by episode
par(bg = "#FFD90F")
barplot(bartfinal$usview ,col = "#4F76DF", col.main = "#4F76DF" ,xaxt = "n" , xlab = NA, ylab = "US view in millions", 
        main = "Bart")
par(new = T)
plot(bartfinal$imdb, axes = F, xaxt = "n" , xlab = NA, ylab = NA )
axis(side = 4)
mtext(side = 4, line = 3, "IMDb Rating"  )
lines(bartfinal$imdb, type = "o", col = "#F00699")

#compare episode view numbers with or wothout name in title

withorwithout <- data.frame(
  TitleType = factor(c("With Names","Without Names"), levels=c(c("With Names","Without Names"))),
  AverageViewNumbers = c(14.59, 10.91))

ggplot(data = withorwithout, aes(x = TitleType, y=AverageViewNumbers, fill = TitleType))+
  geom_bar(stat = "identity", width = .5) +
  geom_hline(yintercept=11.84) +
  scale_fill_manual(values=c("#9e66ab", "#599ad3"))
  

  


















