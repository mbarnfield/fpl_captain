# Multilevel fantasy football point prediction
# Matthew Barnfield

# Prediction

# load packages
librarian::shelf(tidyverse,
                 here,
                 brms)

# load model
fpl_fit <- read_rds(here("models", "main_model.RDS"))

# new data to fit values for (upcoming gameweek)
gw5_ha <- filter(all_fixtures, gw == 5)
gw5_all <- filter(fixtures_all, gw == 5) %>%
  rename(team = team_1,
         opponent = team_2) %>%
  select(-gw)

gw5 <- current_gw %>%
  select(player, team, price) %>%
  mutate(home = case_when(
    team %in% gw5_ha$team_h ~ 1,
    TRUE ~0
  )) %>%
  merge(gw5_all) %>%
  mutate(gw = 105)

save(gw5, file = here::here("data", "gw5.rda"))

gw5_min <- filter(gw5,
                  player %in% fpl_min_point$player)

save(gw5_min, file = here::here("data", "gw5_min.rda"))

# with fitted()
pred <- fitted(fpl_fit, newdata = gw5_min)
pred <- cbind(gw5_min, pred)
pred$where <- case_when(pred$home == 0 ~ "Away", TRUE ~ "Home")

# top 10
top_10 <- pred %>%
  arrange(desc(Estimate)) %>%
  slice(1:10)

# top 25
top_25 <- pred %>%
  arrange(desc(Estimate)) %>%
  slice(1:25)

# top 50
top_50 <- pred %>%
  arrange(desc(Estimate)) %>%
  slice(1:50)

# plot
ggplot2::ggplot(top_10, aes(reorder(player, Estimate), 
                            Estimate,
                            label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.35, 
             nudge_y = -.75,
             label.padding = unit(0.1, "lines"), 
             label.size = 0,
             size = 1.5) +
  ylab("Fitted points") +
  xlab("") +
  ggtitle("Top 10 highest predicted points, gameweek 5, 2019",
          subtitle = "Prior: normal(0, 1.5). Uses fitted() function.")

ggsave(here::here("images", "gameweek_5_top10.png"))

ggplot2::ggplot(top_25, aes(reorder(player, Estimate), 
                            Estimate,
                            label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.35, 
             nudge_y = -.75,
             label.padding = unit(0.1, "lines"), 
             label.size = 0,
             size = 1.5) +
  ylab("Fitted points") +
  xlab("") +
  ggtitle("Top 25 highest predicted points, gameweek 5, 2019",
          subtitle = "Prior: normal(0, 1.5). Uses fitted() function.")

ggsave(here::here("images", "gameweek_5_top25.png"))

ggplot2::ggplot(top_50, aes(reorder(player, Estimate), 
                            Estimate,
                            label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.45, 
             nudge_y = -.75,
             label.padding = unit(0.05, "lines"), 
             label.size = 0,
             size = 1.5) +
  ylab("Fitted points") +
  xlab("") +
  ggtitle("Top 50 highest predicted points, gameweek 5, 2019",
          subtitle = "Prior: normal(0, 1.5). Uses fitted() function.")

ggsave(here::here("images", "gameweek_5_top50.png"))


# with predict()
pred_p <- predict(fpl_fit, newdata = gw5_min)
pred_p <- cbind(gw5_min, pred_p)
pred_p$where <- case_when(pred$home == 0 ~ "Away", TRUE ~ "Home")

# top 10
top_10_p <- pred_p %>%
  arrange(desc(Estimate)) %>%
  slice(1:10)

# top 25
top_25_p <- pred_p %>%
  arrange(desc(Estimate)) %>%
  slice(1:25)

# top 50
top_50_p <- pred_p %>%
  arrange(desc(Estimate)) %>%
  slice(1:50)

# plot
ggplot2::ggplot(top_10_p, aes(reorder(player, Estimate), 
                            Estimate,
                            label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.35, 
             nudge_y = -1.5,
             label.padding = unit(0.1, "lines"), 
             label.size = 0,
             size = 1.5) +
  ylab("Predicted points") +
  xlab("") +
  ggtitle("Top 10 highest predicted points, gameweek 5, 2019",
          subtitle = "Prior: normal(0, 1.5). Uses predict() function.")

ggsave(here::here("images", "gameweek_5_top10_p.png"))

ggplot2::ggplot(top_25_p, aes(reorder(player, Estimate), 
                            Estimate,
                            label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.35, 
             nudge_y = -1.5,
             label.padding = unit(0.1, "lines"), 
             label.size = 0,
             size = 1.5) +
  ylab("Predicted points") +
  xlab("") +
  ggtitle("Top 25 highest predicted points, gameweek 5, 2019",
          subtitle = "Prior: normal(0, 1.5). Uses predict() function.")

ggsave(here::here("images", "gameweek_5_top25_p.png"))

ggplot2::ggplot(top_50_p, aes(reorder(player, Estimate), 
                            Estimate,
                            label = paste0(where, " for ", team, " vs ", opponent))) +
  geom_pointrange(aes(ymin = Q2.5, ymax = Q97.5, colour = price), shape = 18) +
  coord_flip() +
  scale_color_gradient(low = "darkturquoise", high = "#3D195B",
                       name = "Price") +
  geom_label(nudge_x = 0.35, 
             nudge_y = -1.5,
             label.padding = unit(0.05, "lines"), 
             label.size = 0,
             size = 1.5) +
  ylab("Predicted points") +
  xlab("") +
  ggtitle("Top 50 highest predicted points, gameweek 5, 2019",
          subtitle = "Prior: normal(0, 1.5). Uses predict() function.")

ggsave(here::here("images", "gameweek_5_top50_p.png"))

