test_that("check if the package retrieves field data as data.frame", {
  # retrieve data for the OSBS site for 2019
  tst <- retrieve_VST_data(site = "OSBS", start = 2019)
  # check that the data retrieved is a data frame
  expect_is(tst,'list')

})

#Currently fails, NEON needs to respond.
test_that("check if the package retrieves field data without duplicating eventIDs", {
  # retrieve data for the OSBS site for 2019
  BART_data <- retrieve_VST_data(site = "BART")
  
  # Verify the same individual ID in the same year doesn't have more than one height
  multiple_heights<-BART_data[[4]] %>% group_by(individualID,eventID)  %>% summarize(n=length(unique(height))) %>% filter(n>1)
  expect_equal(nrow(multiple_heights), 0)
})


