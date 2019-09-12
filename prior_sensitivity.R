# sensitivity of new players to priors

library(tidyverse)
library(here)
library(brms)

# formula
f <- points ~ s(gw) + player + opponent + home + (1 | team)

# very narrow prior
prior_1 <- c(brms::set_prior("normal(0, 1.5)", class = "b"),
           set_prior("normal(1, 5)", coef = "opponentNorwich"),
           set_prior("normal(1, 5)", coef = "opponentAstonVilla"),
           set_prior("normal(1, 5)", coef = "opponentSheffieldUtd"),
           set_prior("student_t(3, 0, 10)", class = "Intercept"),
           set_prior("student_t(3, 0, 10)", class = "sigma"),
           set_prior("student_t(3, 0, 10)", class = "sd"),
           set_prior("student_t(3, 0, 10)", class = "sds")
)

# train model
normal_1.5 <- brms::brm(
  f,
  fpl_min_point,
  family = gaussian(),
  prior = prior_1,
  iter = 2e3,
  warmup = 500,
  chains = 4,
  cores = 4,
  refresh = 10,
  algorithm = "meanfield"
)

# fit predictions
pred_1.5 <- fitted(normal_1.5, newdata = gw5_min)
pred_1.5 <- cbind(gw5_min, pred_1.5)
pred_1.5$where <- case_when(pred_1.5$home == 0 ~ "Away", TRUE ~ "Home")

# top 25
top_25_1.5 <- pred_1.5 %>%
  arrange(desc(Estimate)) %>%
  slice(1:25)

# plot 
ggplot2::ggplot(top_25_1.5, aes(reorder(player, Estimate), 
                                       Estimate,
                                       label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.35, 
             nudge_y = -.6,
             label.padding = unit(0.1, "lines"), 
             label.size = 0,
             size = 2.5) +
  ylab("Estimated points, gameweek 5") +
  xlab("Player") +
  ggtitle("Prior normal(0, 1.5), gameweek 5, 2019")

ggsave(here::here("sensitivity", "normal(0, 1.5).png"))

       
# less narrow prior
prior_2.5 <- c(brms::set_prior("normal(0, 2.5)", class = "b"),
           set_prior("normal(1, 5)", coef = "opponentNorwich"),
           set_prior("normal(1, 5)", coef = "opponentAstonVilla"),
           set_prior("normal(1, 5)", coef = "opponentSheffieldUtd"),
           set_prior("student_t(3, 0, 10)", class = "Intercept"),
           set_prior("student_t(3, 0, 10)", class = "sigma"),
           set_prior("student_t(3, 0, 10)", class = "sd"),
           set_prior("student_t(3, 0, 10)", class = "sds")
)

# train model
normal_2.5 <- brms::brm(
  f,
  fpl_all,
  family = gaussian(),
  prior = prior_2.5,
  iter = 2e3,
  warmup = 500,
  chains = 4,
  cores = 4,
  refresh = 10,
  algorithm = "meanfield"
)

# fit predictions
pred_2.5 <- fitted(normal_2.5, newdata = gw5)
pred_2.5 <- cbind(gw5, pred_2.5)
pred_2.5$where <- case_when(pred_2.5$home == 0 ~ "Away", TRUE ~ "Home")

# top 25
top_25_2.5 <- pred_2.5 %>%
  arrange(desc(Estimate)) %>%
  slice(1:25)

# plot 
ggplot2::ggplot(top_25_2.5, aes(reorder(player, Estimate), 
                              Estimate,
                              label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.35, 
             nudge_y = -.6,
             label.padding = unit(0.1, "lines"), 
             label.size = 0,
             size = 2.5) +
  ylab("Estimated points, gameweek 5") +
  xlab("Player") +
  ggtitle("Prior normal(0, 2.5), gameweek 5, 2019")

ggsave(here::here("sensitivity", "normal(0, 2.5).png"))

# wide prior
prior_10 <- c(brms::set_prior("normal(0, 10)", class = "b"),
           set_prior("normal(1, 5)", coef = "opponentNorwich"),
           set_prior("normal(1, 5)", coef = "opponentAstonVilla"),
           set_prior("normal(1, 5)", coef = "opponentSheffieldUtd"),
           set_prior("student_t(3, 0, 10)", class = "Intercept"),
           set_prior("student_t(3, 0, 10)", class = "sigma"),
           set_prior("student_t(3, 0, 10)", class = "sd"),
           set_prior("student_t(3, 0, 10)", class = "sds"))

# train model
normal_10 <- brms::brm(
  f,
  fpl_all,
  family = gaussian(),
  prior = prior_10,
  iter = 2e3,
  warmup = 500,
  chains = 4,
  cores = 4,
  refresh = 10,
  algorithm = "meanfield"
)

# fit predictions
pred_10 <- fitted(normal_10, newdata = gw5)
pred_10 <- cbind(gw5, pred_10)
pred_10$where <- case_when(pred_10$home == 0 ~ "Away", TRUE ~ "Home")

# top 25
top_25_10 <- pred_10 %>%
  arrange(desc(Estimate)) %>%
  slice(1:25)

# plot 
ggplot2::ggplot(top_25_10, aes(reorder(player, Estimate), 
                                Estimate,
                                label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.35, 
             nudge_y = -.6,
             label.padding = unit(0.1, "lines"), 
             label.size = 0,
             size = 2.5) +
  ylab("Estimated points, gameweek 5") +
  xlab("Player") +
  ggtitle("Prior normal(0, 10), gameweek 5, 2019")

ggsave(here::here("sensitivity", "normal(0, 10).png"))

# very wide prior
prior_50 <- c(brms::set_prior("normal(0, 50)", class = "b"),
              set_prior("normal(1, 5)", coef = "opponentNorwich"),
              set_prior("normal(1, 5)", coef = "opponentAstonVilla"),
              set_prior("normal(1, 5)", coef = "opponentSheffieldUtd"),
              set_prior("student_t(3, 0, 10)", class = "Intercept"),
              set_prior("student_t(3, 0, 10)", class = "sigma"),
              set_prior("student_t(3, 0, 10)", class = "sd"),
              set_prior("student_t(3, 0, 10)", class = "sds")
)

# train model
normal_50 <- brms::brm(
  f,
  fpl_all,
  family = gaussian(),
  prior = prior_50,
  iter = 2e3,
  warmup = 500,
  chains = 4,
  cores = 4,
  refresh = 10,
  algorithm = "meanfield"
)

# fit predictions
pred_50 <- fitted(normal_50, newdata = gw5)
pred_50 <- cbind(gw5, pred_50)
pred_50$where <- case_when(pred_50$home == 0 ~ "Away", TRUE ~ "Home")

# top 25
top_25_50 <- pred_50 %>%
  arrange(desc(Estimate)) %>%
  slice(1:25)

# plot 
ggplot2::ggplot(top_25_50, aes(reorder(player, Estimate), 
                                Estimate,
                                label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.35, 
             nudge_y = -.6,
             label.padding = unit(0.1, "lines"), 
             label.size = 0,
             size = 2.5) +
  ylab("Estimated points, gameweek 5") +
  xlab("Player") +
  ggtitle("Prior normal(0, 50), gameweek 5, 2019")

ggsave(here::here("sensitivity", "normal(0, 50).png"))

