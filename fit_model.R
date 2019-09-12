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
f <- points ~ s(gw) + player + opponent + home + (1 | team)

# specify priors
prior <- c(brms::set_prior("normal(0, 1.5)", class = "b"),
           set_prior("normal(1, 5)", coef = "opponentNorwich"),
           set_prior("normal(1, 5)", coef = "opponentAstonVilla"),
           set_prior("normal(1, 5)", coef = "opponentSheffieldUtd"),
           set_prior("student_t(3, 0, 10)", class = "Intercept"),
           set_prior("student_t(3, 0, 10)", class = "sigma"),
           set_prior("student_t(3, 0, 10)", class = "sd"),
           set_prior("student_t(3, 0, 10)", class = "sds"))

# train model
m <- brms::brm(
  f,
  fpl_min_point,
  family = gaussian(),
  prior = prior,
  file = here::here("models", "main_model"),
  iter = 4e3,
  warmup = 1000,
  chains = 4,
  cores = 4,
  refresh = 50,
  control = list(adapt_delta = 0.99)
)

prior <- c(brms::set_prior("normal(0, 0.5)", class = "b"),
           set_prior("normal(1, 5)", coef = "opponentNorwich"),
           set_prior("normal(1, 5)", coef = "opponentAstonVilla"),
           set_prior("normal(1, 5)", coef = "opponentSheffieldUtd"),
           set_prior("student_t(3, 0, 10)", class = "Intercept"),
           set_prior("student_t(3, 0, 10)", class = "sigma"),
           set_prior("student_t(3, 0, 10)", class = "sd"),
           set_prior("student_t(3, 0, 10)", class = "sds")
)

m_train_normal_0.5 <- brms::brm(f,
                                fpl_min_point,
                                family = gaussian(),
                                prior = prior,
                                file = here::here("data", "train_11"),
                                iter = 2e3,
                                warmup = 500,
                                chains = 4,
                                cores = 4,
                                refresh = 100)


# update model
m_2 <- update(
  train_3,
  newdata = fpl_all,
  file = here::here("data", "fpl_fit_gw4"),
  iter = 2e3,
  cores = 4,
  chains = 4,
  recompile = F
)


