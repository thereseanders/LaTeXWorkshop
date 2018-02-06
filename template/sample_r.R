#########################
# POIR LaTeX Workshop
# Sample R file
# Author: Therese Anders
# Created: 4/11/2016
#########################

rm(list = ls())
library(foreign)
library(stargazer)

setwd("/Users/thereseanders/Documents/UNI/USC/Resources/Latex/LaTeXWorkshop_2018/template")
dat <- read.dta("IPEsubset.dta")


## A bunch of models
mod1 <- lm(internet ~ polity, data = dat)
mod2 <- lm(internet ~ polity + pop + gdppc, data = dat)
mod3 <- lm(internet ~ life_exp, data = dat)
mod4 <- lm(life_exp ~ gdppc, data = dat)

## Writing them all to a table
# Simple
stargazer(mod1, mod2, mod3, mod4,
          float = F, #This is just for putting it in the beamer presentation. Default is T.
          out = "tab_simple.tex")

# Somewhat fancier
stargazer(mod1, mod2, mod3, mod4,
          font.size = "scriptsize",
          float = F,
          digits = 4,
          omit.stat = "f",
          covariate.labels = c("Polity Score",
                               "Population",
                               "GDP p.c.",
                               "Life Expectancy"),
          dep.var.labels = c("Internet Users","Life Expectancy"),
          column.sep.width = "0pt",
          no.space = T,
          out = "tab_fancy.tex")


# Again fancier, for inclusion in article style document
stargazer(mod2, mod4,
          font.size = "scriptsize",
          float = T,
          digits = 4,
          omit.stat = "f",
          covariate.labels = c("Polity Score",
                               "Population",
                               "GDP p.c."),
          dep.var.labels = c("Internet Users","Life Expectancy"),
          column.sep.width = "0pt",
          no.space = T,
          title = "Table created with R's stargazer package.",
          out = "tab_fancy_article.tex")
