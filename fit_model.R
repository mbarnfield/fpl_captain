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
str(fpl_min_point)

# specify formula NOW RUNNING WITHOUT SPLINE
f <- points | weights(weight) ~ 
  player + opponent + home + minutes + (1 | mm(team_1, team_2))


# specify priors
prior_rec <- get_prior(f, fpl_min_point)
prior <- c(
  brms::set_prior("normal(0, 0.5)", class = "b"),
  set_prior("normal(1, 5)", coef = "opponentNorwich"),
  set_prior("normal(1, 5)", coef = "opponentAstonVilla"),
  set_prior("normal(1, 5)", coef = "opponentSheffieldUtd"),
  set_prior("student_t(3, 1, 10)", class = "Intercept"),
  set_prior("student_t(3, 0, 10)", class = "sigma"),
  set_prior("student_t(3, 0, 10)", class = "sd")
)


# train model - RUN OUTSIDE OF R PROJECT
m_gw6 <- brms::brm(
  f,
  fpl_all,
  family = gaussian(),
  prior = prior,
  iter = 4e3,
  warmup = 1000,
  chains = 4,
  cores = 4,
  refresh = 100,
  control = list(adapt_delta = 0.9)
)

# meanfield check
m_gw6 <- brms::brm(
  f,
  fpl_all,
  family = gaussian(),
  prior = prior,
  iter = 4e3,
  warmup = 1000,
  chains = 4,
  cores = 4,
  refresh = 100,
  algorithm = "meanfield"
)



saveRDS(m_gw6, file = "main_model_gw6.rds")





overtime <- fitted(m_gw6, newdata = fpl_all)
overtime <- cbind(overtime, fpl_all)
 
overtime_mané <- overtime %>%
  filter(player == "Sadio Mané")
overtime_son <- overtime %>%
  filter(player == "Heung-Min Son")
overtime_salah <- overtime %>%
  filter(player == "Mohamed Salah")
