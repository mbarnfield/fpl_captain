# Multilevel fantasy football point prediction
# Matthew Barnfield

# Multilevel model

# now training model on second half of 2018-19 season, wider priors

# load packages
library(tidyverse)
library(here)
library(brms)


# load data
load(here::here("data", "fpl_min_point.rda"))

# specify formula
f <- points | weights(weight) ~ s(gw) + player + opponent + home + (1 | mm(team_1, team_2))

# specify priors
prior <- c(brms::set_prior("normal(0, 1.5)", class = "b"),
           set_prior("normal(1, 5)", coef = "opponentNorwich"),
           set_prior("normal(1, 5)", coef = "opponentAstonVilla"),
           set_prior("normal(1, 5)", coef = "opponentSheffieldUtd"),
           set_prior("student_t(3, 0, 10)", class = "Intercept"),
           set_prior("student_t(3, 0, 10)", class = "sigma"),
           set_prior("student_t(3, 0, 10)", class = "sd"),
           set_prior("student_t(3, 0, 10)", class = "sds"))

# train model - RUN OUTSIDE OF R PROJECT
m <- brms::brm(
  f,
  fpl_min_point,
  family = gaussian(),
  prior = prior,
  iter = 4e3,
  warmup = 1000,
  chains = 4,
  cores = 4,
  refresh = 50,
  control = list(adapt_delta = 0.99)
)

