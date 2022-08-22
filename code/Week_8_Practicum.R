library(haven)
library(tidyverse)
library(fixest)

df <- read_sas("data/sample10.sas7bdat")

#Q1
vtable::vtable(df)

#Q2
df %>%
  filter(FYEAR == 1995) %>%
  nrow()

#Q3
df %>%
  filter(FYEAR == 2008) %>%
  nrow()

#Q4
df %>%
  nrow()

#Q5
modelQ5 <- feols(che2 ~ lev2 + rank5ma, data = df)
etable(modelQ5)

#Q6
etable(modelQ5)

#Q7
modelQ7 <- feols(che2 ~ lev2 + rank5ma + capx2 + lgrowth2, data = df)
etable(modelQ7)

#Q8
etable(modelQ7)

#Q9
cor.test(df$capx2, df$rank5ma)
# higher rank5ma -> lower capex

#Q10
df2 <- df %>%
  filter(FYEAR == 2005)

cor.test(df2$capx2, df2$rank5ma)

#Q11
cor.test(df$acc, df$rank5ma)

#Q12
cor.test(df$oancf2, df$rank5ma)

#Q13
cor.test(df$NUMEST, df$rank5ma)

#Q14
cor.test(df$growth2, df$rank5ma)

#Q15
cor.test(df$div, df$rank5ma)

#Q16
cor.test(df$lgrowth2, df$rank5ma)
