pop1900 <- read.csv("baby1900.csv")
pop2000 <- read.csv("baby2000.csv")

#US Names 1900 Data http://darren.dbsdataprojects.com/wp-content/uploads/sites/2/2016/10/yob1900.txt
#US Names 2000 Data http://darren.dbsdataprojects.com/wp-content/uploads/sites/2/2016/10/yob2000.txt
#Name columns as Name, Sex, Number Of Births

population_headers <- c("Name","Sex","NumberOfBirths")
colnames(pop1900) <- population_headers
colnames(pop2000) <- population_headers
#Q1
#Load in the file from 1900 using read.csv into a variable called pop1900

pop1900 = read.csv(url("http://darren.dbsdataprojects.com/wp-content/uploads/sites/2/2016/10/yob1900.txt"), header = FALSE)

#Q2
#Load in the file from 2000 using read.csv into a variable called pop2000
pop2000 = read.csv('http://darren.dbsdataprojects.com/wp-content/uploads/sites/2/2016/10/yob2000.txt', header = FALSE)

#Q3
#How many babies were born in 1900

colSums(pop1900[3])

#Q4
#How many observations of baby names in 1900?

length(pop1900[,1])

#Q5 
#How many variables are in the data set?

ncol(pop1900)

#Q6
#How many babies were born in 2000?

colSums(pop2000[3])

#Q7
#How many names were there in 2000?

length(pop2000[,1])

#Q8
#Which were the 10 most popular male names in 1900?

pop1900[order(pop1900$NumberOfBirths),]
male1900 <-subset(pop1900,pop1900$Sex == 'M')
male1900$Name[1:10]

#Q9
#Which were the 10 most popular female names in 1900?

pop1900[order(pop1900$NumberOfBirths),]
female1900 <-subset(pop1900,pop1900$Sex == 'F')
female1900$Name[1:10]

#Q10
#Which were the 10 most popular male baby names in 2000?

pop2000[order(pop2000$NumberOfBirths),]
male2000 <-subset(pop2000,pop2000$Sex == 'M')
male2000$Name[1:10]

#Q11
#Which are the 10 most popular female baby names in 2000?

pop2000[order(pop2000$NumberOfBirths),]
female2000 <-subset(pop2000,pop2000$Sex == 'F')
top10f2000 <- female2000$Name[1:10]
top10f2000

#Q12
#Which are the 10 most changed male baby names?

names(pop1900) [3] <- paste('n1900')
names(pop2000) [3] <- paste('n2000')
merged_data = merge(pop1900, pop2000, by =c('Name', 'Sex'), all=TRUE)
merged_data$n1900[is.na(merged_data$n1900)] = 0
merged_data$n2000[is.na(merged_data$n2000)] = 0
merged_data$diff = abs(merged_data$n1900-merged_data$n2000)
ordered_diff = merged_data[order(-merged_data$diff, merged_data$Name),]
ordered_diff_male <- subset(ordered_diff, ordered_diff$Sex == 'M')
ordered_diff_male$Name[1:10]

#Q13
#Which are the 10 most changed female baby names?

ordered_diff_female <- subset(ordered_diff, ordered_diff$Sex == 'F')
ordered_diff_female$Name[1:10]

#Q14
#How many Darren's were there in 2000?

Darren2000 <-subset(pop2000,pop2000$Name == 'Darren')
Darren2000

#Q15
#How many Darren's were there in 1900?

Darren1900 <-subset(pop1900,pop1900$Name == 'Darren')
Darren1900


#Plot to show names in 1900 v 2000
plot(ordered_diff_female$n1900, ordered_diff_female$n2000)
plot(ordered_diff_male$n1900, ordered_diff_male$n2000)

#adding text to the top 10 changers
text(ordered_diff_female$n1900[1:10], ordered_diff_female$n2000[1:10], labels=ordered_diff_female$Name[1:10], cex= 0.7, pos=3)
text(ordered_diff_male$n1900[1:10], ordered_diff_male$n2000[1:10], labels=ordered_diff_male$Name[1:10], cex= 0.7, pos=3)

#How Many Ashley and Madison's there were 1900 and 2000?
Ashley1900 <- subset(pop1900, pop1900$Name == 'Ashley')
Ashley1900

Ashley2000 <- subset(pop2000, pop2000$Name == 'Ashley')
Ashley2000

Madison1900 <- subset(pop1900, pop1900$Name == 'Madison')
Madison1900

Madison2000 <- subset(pop2000, pop2000$Name == 'Madison')
Madison2000

