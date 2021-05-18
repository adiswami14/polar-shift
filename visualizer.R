data <- read.csv("data/polarization.csv")

library(tidyverse)

house_data <- data[which(data$chamber == "House"), ]
senate_data <- data[which(data$chamber == "Senate"), ]

house_data %>% 
  plot(
    ((rep.mean.d1+dem.mean.d1)/2) ~ year,
    data = . ,
    main = "Polarization in the house of representatives ",
    sub  = "(Source: datasets::voteview_polarization_data)",
    ylab = "Ideological Spectrum (+ indicates conservative, - indicates liberal)",
    type = "l",
    col = rgb(0.5, 0.2, 0.5),
    ylim=c(-0.6, 0.6)
  )

par(new = TRUE)

house_data %>% 
  plot(
    rep.mean.d1 ~ year,
    data = . ,
    axes = F,
    ylab = "",
    xlab = "",
    type = "l",
    col = rgb(0.85, 0.25, 0.15),
    ylim=c(-0.6, 0.6)
  )

par(new = TRUE)

house_data %>% 
  plot(
    dem.mean.d1 ~ year,
    data = . ,
    axes = F,
    ylab = "",
    xlab = "",
    type = "l",
    col = rgb(0.15, 0.25, 0.85),
    ylim=c(-0.6, 0.6)
  )

abline(v = 2016, col = "lightgray") # election of Donald J. Trump
abline(v = 2000, col = "lightgray") # infamous 2000 election
abline(v = 1980, col = "lightgray") # election of Ronald Reagan
abline(v = 1963, col = "lightgray") # Civil Rights Movement takes forefront of national headline
abline(v = 1950, col = "lightgray") # America joins Vietnam War
abline(v = 1941, col = "lightgray") # America joins World War II
abline(v = 1929, col = "lightgray") # Great Depression begins
abline(v = 1917, col = "lightgray") # America joins World War I
abline(v = 1888, col = "lightgray") # heavily contested 1888 election

text(2016, -0.5, "Election of Trump", cex = 0.4,col = "red3")
text(2000, -0.55, "Election of George W. Bush", cex = 0.4,col = "red3")
text(1980, -0.6, "Election of Ronald Reagan", cex = 0.4,col = "red3")
text(1963, -0.5, "Civil Rights Movement", cex = 0.4,col = "red3")
text(1950, -0.55, "Start of Vietnam War", cex = 0.4,col = "red3")
text(1941, -0.6, "Joining WW2", cex = 0.4,col = "red3")
text(1929, -0.5, "Great Depression", cex = 0.4,col = "red3")
text(1917, -0.55, "Joining WW1", cex = 0.4,col = "red3")
text(1888, -0.6, "Election of Grover Cleveland", cex = 0.4,col = "red3")

legend(
    "topleft", 
    title="Party",
    c("Net Polarization","Republican","Democrat"), 
    fill=c(rgb(0.5, 0.2, 0.5), rgb(0.85, 0.25, 0.15), rgb(0.15, 0.25, 0.85)), 
    horiz=TRUE,
    x.intersp = 0.4
)

quartz()

senate_data %>% 
  plot(
    ((rep.mean.d1+dem.mean.d1)/2) ~ year,
    data = . ,
    main = "Polarization in the Senate ",
    sub  = "(Source: datasets::voteview_polarization_data)",
    ylab = "Ideological Spectrum (+ indicates conservative, - indicates liberal)",
    type = "l",
    col = rgb(0.5, 0.2, 0.5),
    ylim=c(-0.6, 0.6)
  )

par(new = TRUE)

senate_data %>% 
  plot(
    rep.mean.d1 ~ year,
    data = . ,
    axes = F,
    ylab = "",
    xlab = "",
    type = "l",
    col = rgb(0.85, 0.25, 0.15),
    ylim=c(-0.6, 0.6)
  )

par(new = TRUE)

senate_data %>% 
  plot(
    dem.mean.d1 ~ year,
    data = . ,
    axes = F,
    ylab = "",
    xlab = "",
    type = "l",
    col = rgb(0.15, 0.25, 0.85),
    ylim=c(-0.6, 0.6)
  )

abline(v = 2016, col = "lightgray") # election of Donald J. Trump
abline(v = 2000, col = "lightgray") # infamous 2000 election
abline(v = 1980, col = "lightgray") # election of Ronald Reagan
abline(v = 1963, col = "lightgray") # Civil Rights Movement takes forefront of national headline
abline(v = 1950, col = "lightgray") # America joins Vietnam War
abline(v = 1941, col = "lightgray") # America joins World War II
abline(v = 1929, col = "lightgray") # Great Depression begins
abline(v = 1917, col = "lightgray") # America joins World War I
abline(v = 1888, col = "lightgray") # heavily contested 1888 election

text(2016, -0.5, "Election of Trump", cex = 0.4,col = "red3")
text(2000, -0.55, "Election of George W. Bush", cex = 0.4,col = "red3")
text(1980, -0.6, "Election of Ronald Reagan", cex = 0.4,col = "red3")
text(1963, -0.5, "Civil Rights Movement", cex = 0.4,col = "red3")
text(1950, -0.55, "Start of Vietnam War", cex = 0.4,col = "red3")
text(1941, -0.6, "Joining WW2", cex = 0.4,col = "red3")
text(1929, -0.5, "Great Depression", cex = 0.4,col = "red3")
text(1917, -0.55, "Joining WW1", cex = 0.4,col = "red3")
text(1888, -0.6, "Election of Grover Cleveland", cex = 0.4,col = "red3")

legend(
    "topleft", 
    title="Party",
    c("Net Polarization","Republican","Democrat"), 
    fill=c(rgb(0.5, 0.2, 0.5), rgb(0.85, 0.25, 0.15), rgb(0.15, 0.25, 0.85)), 
    horiz=TRUE,
    x.intersp = 0.4
)

rm(list = ls()) 

# Clear packages
pacman::p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base