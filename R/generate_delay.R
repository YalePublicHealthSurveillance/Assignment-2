set.seed(123)


ds1 <- tibble(day_occur = sample(1:120, size=5000, replace=T,prob=1.03^(1:120)) ,
              delay_dist = rpois(5000, lambda=2),
              date_of_diagnosis = as.Date('2017-07-01') + days(day_occur),
              date_of_report =  date_of_diagnosis+ days(delay_dist) ) %>%
  select(date_of_diagnosis,date_of_report) 

ds1 %>%   
  filter(date_of_report<='2017-09-01') %>%
  saveRDS(., 'Data/reported_cases.rds')

#ds1 %>%   
 saveRDS(., 'Data/reported_cases_full_final.rds')
