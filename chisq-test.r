aa00 <- scan()
233  48	20.06	1153	144	12.49
488	88	18.03	898	104	11.58
860	140	16.28	526	52	9.89
980	156	15.92	406	36	8.87
428	43	10.05	958	149	15.55
712	94	13.2	674	98	14.54
712	42	5.9	674	48	7.12
601	74	12.31	785	118	15.03
601	34	5.66	785	56	7.13
  
aa 　<-  matrix(aa00 ,ncol=6, byrow =T)

  CHISQ <- function(i){
    X <- aa[i,c(2,5)];X
    Y <- aa[i,c(1,4)];Y
    p <- Y/sum(Y)
    chi00 <- chisq.test(X, p=p, correct=T)
    c(chi00$statistic,chi00$p.value)
                      }

sapply(1:nrow(aa),CHISQ)