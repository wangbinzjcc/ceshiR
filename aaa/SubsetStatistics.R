#####################################################
#                     wb 2013-4-14 22:05:36
#####################################################
seed.data <- read.csv("Seeds-data-wb.csv")
head(seed.data)

LL00 <- as.numeric(as.character(seed.data$Leaf.g))
sum(LL00, na.rm=T) 

tap00 <- with(seed.data,tapply(LL00, Species, sum))
sort(tap00,decreasing=T)
length(tap00)
ss00 <- sort(tap00,decreasing=T) / sum(tap00, na.rm=T)
cumsum(ss00)-ss00[1]
names(ss00)
 
tap01 <- with(seed.data,tapply(LL00, substr(Time,6,7), sum))
tap01
sum(tap01[5:7]) / sum(tap01)

plot(tap01,type='h', lwd = 10, axes=F,xlab='月份',ylab='落叶量(g)')
axis(side=1, at=1:length(tap01),labels=names(tap01))
axis(side=2)
box()


tap02 <- with(seed.data,tapply(LL00, No..of.collectors, sum))
tap02
plot(tap02)

sum(tap02[5:7]) / sum(tap02)


tap03 <- with(subset(seed.data,Leaf.g>0),
              tapply(Species, No..of.collectors, function(X)length(unique(X))))
tap03
plot(tap03)
abline(lm(tap03~I(1:90)))


########################################################

sub00 <- subset(seed.data,!is.na(Leaf.g),Species)
un00 <- unique( sub00[,1])
write.csv(un00,'unique.csv')
names(seed.data)