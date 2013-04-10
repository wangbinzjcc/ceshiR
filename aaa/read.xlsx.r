##################################################
#                           wb 2013-4-10 11:00:41
##################################################
setwd("F:\\DataW\\seeds\\dataseed")
df.one <- readWorksheetFromFile("Seeds-data-result.xlsx",sheet=1)
summary(df.one)
names(df.one)
for(i in 1:10){
wh00 <- which(is.na(df.one[,1]))
df.one[wh00,1]<-df.one[wh00-1,1]
              }
df00 <- substr(df.one[,1],nchar(df.one[,1])-1,nchar(df.one[,1]))
df.one[,1] <- paste('NGS0', df00, sep='')
df.one[,3] <- gsub('个','',df.one[,3])
gg00 <- grep('/', df.one[,3])
sapply(strsplit(df.one[gg00,3],'/'),function(X)X[1])
sapply(strsplit(df.one[gg00,3],'/'),function(X)X[2])


writeWorksheetToFile("Seeds-data-df.one.xlsx"
                     , data =  df.one , sheet ="FirstSheet"
                    ) 























