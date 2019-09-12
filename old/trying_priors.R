f <- points ~ player + opponent + home + (1 | team)

prior <- c(brms::set_prior("student_t(3, 0, 5)", class = "b"),
           set_prior("student_t(3, 2, 10)", class = "b", coef = "opponentNorwich"),
           set_prior("student_t(3, 2, 10)", class = "b", coef = "opponentAstonVilla"),
           set_prior("student_t(3, 2, 10)", class = "b", coef = "opponentSheffieldUtd"),
           set_prior("student_t(3, 0, 10)", class = "Intercept"),
           set_prior("student_t(3, 0, 10)", class = "sigma"),
           set_prior("gamma(2, 0.1)", class = "nu"),
           set_prior("student_t(3, 0, 10)", class = "sd")
)

m_student_5 <- brms::brm(f,
                    fpl_2019,
                    family = student,
                    prior = prior,
                    file = here::here("data", "check_student_5"),
                    iter = 2e3,
                    chains = 2,
                    cores = 2,
                    refresh = 5)



popo <- posterior_samples(m_student_5) %>%
  select(starts_with("b_opponent")) %>%
  reshape2::melt() 

ggplot(popo,
       aes(value, variable)) +
  tidybayes::geom_halfeyeh()
