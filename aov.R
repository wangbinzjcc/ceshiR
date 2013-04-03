dir()
wj00 <- read.csv('wangjing.csv')
head(wj00)
wj01 <- wj00[wj00$月份==0 & wj00$物种=='桂花',]
head(wj01)
summary(wj01)
aov(yield ~ block + N * P + K, npk)
a00 <- aov(as.numeric(地点) ~ C + N. + P. + k.,wj01)
summary(a00)

with(wj01,plot(地点,N.))

n0 <- wj01$N[wj01$地点=='植物所']
n1 <- wj01$N[wj01$地点=='大埠']

t.test(n0,n1)

require(graphics)

t.test(1:10,y=c(7:20))      # P = .00001855
t.test(1:10,y=c(7:20, 200)) # P = .1245    -- NOT significant anymore

## Classical example: Student's sleep data
plot(extra ~ group, data = sleep)
## Traditional interface
with(sleep, t.test(extra[group == 1], extra[group == 2]))
## Formula interface
t.test(extra ~ group, data = sleep)