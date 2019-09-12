# Multilevel fantasy football point prediction
# Matthew Barnfield

# FF team

# input players
my_team <- tibble(player = c("Lukasz Fabianski",
                             "Seamus Coleman",
                             "Oleksandr Zinchenko",
                             "Andrew Robertson",
                             "Ross Barkley",
                             "Raheem Sterling",
                             "Anthony Martial",
                             "Mohamed Salah",
                             "Mason Greenwood",
                             "Joshua King",
                             "Pierre-Emerick Aubameyang",
                             "Maarten Stekelenburg",
                             "Leander Dendoncker",
                             "Martin Kelly",
                             "John Lundstram"))

# specify gameweek
gweek <- 3

# add team var from current gw df
my_team <- left_join(my_team, select(current_gw, player, team))

# get home/away
fixtures_thisgw <- filter(all_fixtures, gw == gweek) 


# add opponent and retain only relevant vars
my_team <- my_team %>%
  mutate(team_1 = team) %>%
  left_join(filter(fixtures_all, gw == gweek)) %>%
  mutate(home = case_when(
    team %in% fixtures_thisgw$team_h ~ 1,
    TRUE ~ 0
  )) %>%
  mutate(min_prop = 1) %>%
  select(player, team, opponent = team_2, home, min_prop) 

proposed_team <- tibble(player = c("Lukasz Fabianski",
                             "Seamus Coleman",
                             "Oleksandr Zinchenko",
                             "Andrew Robertson",
                             "Ross Barkley",
                             "Raheem Sterling",
                             "Anthony Martial",
                             "Mohamed Salah",
                             "Mason Greenwood",
                             "Joshua King",
                             "Pierre-Emerick Aubameyang",
                             "Maarten Stekelenburg",
                             "Leander Dendoncker",
                             "Martin Kelly",
                             "John Lundstram"))

# add team var from current gw df
proposed_team <- left_join(proposed_team, select(current_gw, player, team))

# get home/away
fixtures_thisgw <- filter(all_fixtures, gw == gweek) 


# add opponent and retain only relevant vars
proposed_team<- proposed_team %>%
  mutate(team_1 = team) %>%
  left_join(filter(fixtures_all, gw == gweek)) %>%
  mutate(home = case_when(
    team %in% fixtures_thisgw$team_h ~ 1,
    TRUE ~ 0
  )) %>%
  mutate(min_prop = 1) %>%
  select(player, team, opponent = team_2, home, min_prop)
