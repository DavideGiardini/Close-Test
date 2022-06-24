library(lmtest)

closetest <- function(s = NULL,
                      c = NULL,
                      o = NULL,
                      order = 1){
  if (order == 1){
    model <- lm(c ~ stats::lag(c) + s + o)
    H0 <- linearHypothesis(model, "s=0")
  }
  else if (order == 2){
    model <- lm(c ~ stats::lag(c) + stats::lag(c,2) + s + stats::lag(s) + o + stats::lag(o))
    H0 <- linearHypothesis(model, c("s=0", "stats::lag(s)=0"))
  }
  else if (order == 3){
    model <- lm(c ~ stats::lag(c) + stats::lag(c,2) + stats::lag(c,3) + s + stats::lag(s) + stats::lag(s,2) + o + stats::lag(o) + stats::lag(o, 2))
    H0 <- linearHypothesis(model, c("s=0", "stats::lag(s)=0", "stats::lag(s, 2)=0"))
  }
  else if (order == 4){
    model <- lm(c ~ stats::lag(c) + stats::lag(c,2) + stats::lag(c,3) + stats::lag(c,4) + s + stats::lag(s) + stats::lag(s,2) + stats::lag(s,3) + o + stats::lag(o) + stats::lag(o,2) + stats::lag(o,3))
    H0 <- linearHypothesis(model, c("s=0", "stats::lag(s)=0", "stats::lag(s, 2)=0", "stats::lag(s, 3)=0"))
  }
  else if (order == 5){
    model <- lm(c ~ stats::lag(c) + stats::lag(c,2) + stats::lag(c,3) + stats::lag(c,4) + stats::lag(c,5) + s + stats::lag(s) + stats::lag(s,2) + stats::lag(s,3) + stats::lag(s,4) + o + stats::lag(o) + stats::lag(o,2) + stats::lag(o,3) + stats::lag(o,4))
    H0 <- linearHypothesis(model, c("s=0", "stats::lag(s)=0", "stats::lag(s, 2)=0", "stats::lag(s, 3)=0", "stats::lag(s, 4)=0"))
  }
  return(H0$`Pr(>F)`)
}
