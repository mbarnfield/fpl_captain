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
gw6_ha <- filter(all_fixtures, gw == 6)
gw6_all <- filter(fixtures_all, gw == 6) %>%
  rename(team = team_1,
         opponent = team_2) %>%
  select(-gw)

gw6 <- current_gw %>%
  select(player, team, price, team_1, team_2, minutes) %>%
  mutate(home = case_when(
    team %in% gw6_ha$team_h ~ 1,
    TRUE ~0
  )) %>%
  merge(gw6_all) %>%
  mutate(gw = 106)

save(gw6, file = here::here("data", "gw6.rda"))

gw6_min <- gw6 %>%
  filter(player %in% fpl_min_point$player)

sum(gw6_min$opponent %in% fpl_min_point$opponent)

save(gw6_min, file = here::here("data", "gw6_min.rda"))

str(gw6_min)
str(fpl_min_point)
str(fpl_all)

# with fitted()
pred <- fitted(m_gw6, newdata = gw6)
pred <- cbind(gw6, pred)
pred$where <- case_when(pred$home == 0 ~ "Away", TRUE ~ "Home")

# no spline
pred_ns <- fitted(m_gw6, newdata = gw6)
pred_ns <- cbind(gw6, pred_ns)
pred_ns$where <- case_when(pred_ns$home == 0 ~ "Away", TRUE ~ "Home")

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
  ggtitle("Top 25 highest predicted points, gameweek 6, 2019",
          subtitle = "Prior: normal(0, 0.5). Uses fitted() function.")

ggsave(here::here("images", "gameweek_6_top25.png"))



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
pred_p <- predict(m_gw6, newdata = gw6)
pred_p <- cbind(gw6, pred_p)
pred_p$where <- case_when(pred_p$home == 0 ~ "Away", TRUE ~ "Home")

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
  ggtitle("Top 25 highest predicted points, gameweek 6, 2019",
          subtitle = "Prior: normal(0, 0.5). Uses predict() function.")

ggsave(here::here("images", "gameweek_6_top25_p.png"))

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

