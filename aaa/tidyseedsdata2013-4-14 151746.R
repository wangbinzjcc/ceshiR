##################################################
#                           wb 2013-4-10 11:00:41
##################################################
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre7")
require(rJava)
require(XLConnect)
####
setwd("F:\\GitHub\\ceshiR\\aaa")
df.one <- readWorksheetFromFile("Seeds-data-df.one.xlsx",sheet=1)
summary(df.one)
names(df.one)
 未成熟种子
gg00 <- grep('/', df.one[,3])
ff0 <- ff1 <- df.one[,3]
ff0[gg00] <- sapply(strsplit(df.one[gg00,3],'/'),function(X)X[1])
df.one$Fruit.ripe.g <- as.numeric(ff0)

ff1[gg00] <- sapply(strsplit(df.one[gg00,3],'/'),function(X)X[2])
df.one$Fruit.ripe.num <- as.numeric(ff1)



gg01 <- grep('/', df.one[,7])
ff0 <- df.one[,7]
ff0[gg01] <- sapply(strsplit(df.one[gg01,7],'/'),function(X)X[1])
df.one$mature.seed.g <- as.numeric(ff0)

ff1 <- df.one[,8]
ff1[gg01] <- sapply(strsplit(df.one[gg01,7],'/'),function(X)X[2])
df.one$mature.seed.num <- as.numeric(ff1)



gg02 <- grep('/', df.one[,9])
ff0 <- df.one[,9]
ff0[gg02] <- sapply(strsplit(df.one[gg02,9],'/'),function(X)X[1])
df.one$Immature.seed.g <- as.numeric(ff0)

ff1 <- df.one[,10]
ff1[gg02] <- sapply(strsplit(df.one[gg02,9],'/'),function(X)X[2])
df.one$Immature.seed.num <- as.numeric(ff1)


writeWorksheetToFile("Seeds-data-df.one1.xlsx"
                     , data =  df.one , sheet ="FirstSheet"
                    ) 



#########################################################################






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

 