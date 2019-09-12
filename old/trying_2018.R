library(brms)
library(tidyverse)

current_gw <- 21
fpl_2018$time_before_gw <- current_gw - fpl_2018$gw

fpl_2018$weight <- 1*exp(-fpl_2018$time_before_gw/20)

ggplot(fpl_2018, aes(gw, weight)) +
  geom_point()

fpl_train <- filter(fpl_2018, gw %in% c(1:20))

ggplot(fpl_train, aes(gw, weight)) +
  geom_point()

f <- points ~ 1 + player + opponent + home

prior <- c(brms::set_prior("normal(0, 10)", class = "b"),
           set_prior("normal(0, 7.5)", class = "Intercept"),
           set_prior("exponential(10)", class = "sigma"))


train_fit <- brms::brm(f,
                       data = fpl_train,
                       prior = prior,
                       file = here::here("data", "train_2018_4"),
                       iter = 4e3,
                       chains = 2,
                       cores = 2)
summary(train_fit
        )
fpl_test <- filter(fpl_2018, gw %in% 21:38) %>%
  filter(player %in% fpl_train$player)

pred_2018 <- fitted(train_2018_2,
               newdata = fpl_test)
head(pred_2018)

fpl_test <- cbind(fpl_test, pred_2018)
  
fpl_test <- mutate(fpl_test, error = abs(points - Estimate))

fpl_train <- fpl_train %>%
  group_by(player) %>%
  mutate(avg = mean(points))

top_performers <- fpl_train %>%
  group_by(player, avg) %>%
  top_n(10)

ggplot2::ggplot(filter(fpl_test, price == 6),
                aes(gw, Estimate, colour = player)) +
  geom_line() +
  geom_point(aes(y = points)) +
  labs(title = "Expensive")

gws <- c(1:38)
gw_rescale <- scales::rescale(gws, to = c(1,2), from = c(1,38))
gw_rescale
gw_exp <- exp(gws/25)
gw_exp
?exp
